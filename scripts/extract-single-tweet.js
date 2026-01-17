// Extract a single tweet from a tweet detail page (x.com/user/status/...)
// Usage: Open DevTools console on the tweet page, paste and run

function extractTweet() {
  const article = document.querySelector('article[data-testid="tweet"]');
  if (!article) return null;

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

const tweet = extractTweet();
console.log(JSON.stringify(tweet, null, 2));
copy(JSON.stringify(tweet, null, 2));
console.log("Copied to clipboard");
