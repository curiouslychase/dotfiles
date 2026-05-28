// Extract tweets from x.com/home page
// Usage: Open DevTools console on x.com, paste this script, run it
// Scrolls automatically and collects tweets, dedupes by URL

(async function extractTweets() {
  const tweetsMap = new Map(); // dedupe by URL
  const scrollDelay = 500;
  const maxScrolls = 100; // adjust for more tweets
  let lastHeight = 0;
  let noChangeCount = 0;

  function parseTweet(article) {
    const tweetText = article.querySelector('[data-testid="tweetText"]');
    const statusLink = article.querySelector('a[href*="/status/"]');

    const tweet = {
      url: statusLink ? `https://x.com${statusLink.getAttribute("href")}` : null,
      text: tweetText?.textContent || null,
      replies: 0,
      retweets: 0,
      likes: 0,
    };

    const metricsGroup = article.querySelector("[role='group'][aria-label]");
    if (metricsGroup) {
      const label = metricsGroup.getAttribute("aria-label");
      const replyMatch = label.match(/(\d+(?:,\d+)*)\s*repl/i);
      const retweetMatch = label.match(/(\d+(?:,\d+)*)\s*repost/i);
      const likeMatch = label.match(/(\d+(?:,\d+)*)\s*like/i);
      if (replyMatch) tweet.replies = parseInt(replyMatch[1].replace(/,/g, ""));
      if (retweetMatch) tweet.retweets = parseInt(retweetMatch[1].replace(/,/g, ""));
      if (likeMatch) tweet.likes = parseInt(likeMatch[1].replace(/,/g, ""));
    }

    return tweet;
  }

  function collectVisible() {
    const articles = document.querySelectorAll('article[data-testid="tweet"]');
    articles.forEach((article) => {
      try {
        const tweet = parseTweet(article);
        if (tweet.url && !tweetsMap.has(tweet.url)) {
          tweetsMap.set(tweet.url, tweet);
        }
      } catch (e) {
        console.error("Error parsing tweet:", e);
      }
    });
  }

  console.log("Starting tweet collection... scroll will begin");

  for (let i = 0; i < maxScrolls && tweetsMap.size < 200; i++) {
    collectVisible();
    if (tweetsMap.size >= 200) break;

    window.scrollBy(0, window.innerHeight);
    await new Promise((r) => setTimeout(r, scrollDelay));

    const newHeight = document.body.scrollHeight;
    if (newHeight === lastHeight) {
      noChangeCount++;
      if (noChangeCount >= 5) {
        console.log("Reached end of feed");
        break;
      }
    } else {
      noChangeCount = 0;
    }
    lastHeight = newHeight;

    if (i % 10 === 0) {
      console.log(`Collected ${tweetsMap.size} tweets so far...`);
    }
  }

  collectVisible(); // final collection

  const data = Array.from(tweetsMap.values());
  console.log(JSON.stringify(data, null, 2));
  copy(JSON.stringify(data, null, 2));
  console.log(`Done! Extracted ${data.length} tweets, copied to clipboard`);

  return data;
})();
