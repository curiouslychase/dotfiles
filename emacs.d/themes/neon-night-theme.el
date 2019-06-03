;;; neon-night-theme.el --- yet another theme for emacs -*- lexical-binding: t; -*-
;;; Commentary:
;; Neon Night theme is a pseudo-port from a theme made for VS Code
;;
;;; Code:

(setq debug-on-error t)

(deftheme neon-night
  "Neon Night Theme")

(let ((c `((class color)))
      (black "#1B1E26")
      (grey "#2D323F")
      (magenta "#59496D");;
      (green "#4D9B80")
      (mid-magenta "#795087")
      (bright-black "#20242D")
      (bright-grey "#676784")
      (bright-red "#FF8E8E")
      (bright-green "#7EFDD0")
      (bright-yellow "#FCAD3F")
      (bright-blue "#69B4F9")
      (bright-magenta "#DD92F6")
      (bright-cyan "#0adeff")
      (bright-white "#C7C8FF")
      )

  (custom-theme-set-faces
   `neon-night

   `(default ((,c :inherit nil :stipple nil :background ,bright-black :foreground ,bright-white)))
   `(cursor ((,c :background ,bright-magenta)))
   `(hl-line ((,c :background ,grey)))
   `(line-number ((,c :foreground ,mid-magenta)))
   `(fringe ((,c :background ,bright-black)))
   `(lazy-highlight ((,c :background ,mid-magenta)))
   `(trailing-whitespace ((,c :background ,bright-red)))
   `(vertical-border ((,c :foreground ,magenta)))
   `(minibuffer ((,c :background ,black)))
   `(minibuffer-prompt ((,c :foreground ,bright-magenta :bold t :weight bold)))
   `(warning ((,c :foreground ,bright-yellow)))
   `(success ((,c :foreground ,bright-green)))
   `(error ((,c :foreground ,bright-red)))

   `(font-lock-warning-face ((,c :foreground ,bright-red)))
   `(font-lock-builtin-face ((,c :foreground ,bright-magenta)))
   `(font-lock-variable-name-face ((,c :foreground ,bright-white :weight bold)))
   `(font-lock-function-face ((,c :foreground ,bright-magenta)))
   `(font-lock-keyword-face ((,c :foreground ,bright-magenta)))
   `(font-lock-comment-face ((,c :foreground ,bright-grey)))
   `(font-lock-comment-delimiter-face ((,c :foreground ,magenta)))
   `(font-lock-string-face ((,c :foreground ,bright-green)))
   `(font-lock-type-face ((,c :foreground ,bright-magenta)))

   `(grep-hit-match ((,c :background ,magenta)))
   `(grep-match-match ((,c :background ,magenta)))
   `(match ((,c :background ,magenta)))
   `(isearch ((,c :background ,magenta)))
   `(isearch-fail ((,c :foreground ,bright-black :background ,bright-red)))
   `(popup-isearch-match ((,c :foreground ,bright-black :background ,bright-cyan)))

   `(button ((,c :foreground ,bright-blue :underline t)))
   `(highlight ((,c :foreground ,bright-cyan :background ,black)))
   `(link ((,c :foreground ,bright-blue :underline t)))
   `(link-visited ((,c :foreground ,bright-magenta :underline t)))
   `(cursor ((,c :background ,bright-magenta)))
   `(show-paren-match ((,c :foreground ,bright-black :background ,bright-magenta)))
   `(show-paren-mismatch ((,c :foreground ,bright-black :background ,bright-yellow)))
   `(paren-face-no-match ((,c :foreground ,bright-black :background ,bright-red)))

   `(message-cited-text ((,c :foreground ,bright-red)))
   `(message-header-cc ((,c :foreground ,bright-green :bold t :weight bold)))
   `(message-header-name ((,c :foreground ,bright-green)))
   `(message-header-newsgroups ((,c :foreground ,bright-magenta :slant italic)))
   `(message-header-other ((,c :foreground ,bright-blue :slant italic)))
   `(message-header-subject ((,c :foreground ,bright-white :bold t weight bold)))
   `(message-header-to ((,c :foreground ,bright-cyan :bold t weight bold)))
   `(message-header-xheader ((,c :foreground ,bright-blue)))
   `(message-mml ((,c :foreground ,bright-green)))
   `(message-separator ((,c :foreground ,bright-white)))

   `(js2-error ((,c :underline (:color ,bright-red :style wave))))
   `(js2-warning ((,c :underline (:color ,bright-yellow :style wave))))
   `(js2-external-variable ((,c :foreground ,bright-magenta :bold t :weight bold)))
   `(js2-function-param ((,c :foreground ,bright-cyan :slant italic)))
   `(js2-private-function-call ((,c :foreground ,bright-magenta)))
   `(js2-private-member ((,c :foreground ,bright-magenta)))
   `(js2-instance-member ((,c :foreground ,bright-magenta)))
   `(rjsx-tag ((,c :foreground ,bright-magenta)))

   `(org-block ((,c :foreground ,bright-white)))
   `(org-block-begin-line ((,c :foreground ,bright-magenta)))
   `(org-document-title ((,c :foreground ,bright-green)))
   `(org-document-info-keyword ((,c :foreground ,bright-cyan :weight bold)))
   `(org-level-1 ((,c :foreground ,bright-magenta)))
   `(org-level-2 ((,c :foreground ,bright-cyan)))
   `(org-level-3 ((,c :foreground ,bright-cyan)))
   `(org-level-4 ((,c :foreground ,bright-cyan)))
   `(org-level-5 ((,c :foreground ,bright-cyan)))
   `(org-level-6 ((,c :foreground ,bright-cyan)))
   `(org-level-7 ((,c :foreground ,bright-cyan)))
   `(org-level-8 ((,c :foreground ,bright-cyan)))
   `(org-code ((,c :foreground ,bright-blue)))
   `(org-verbatim ((,c :foreground ,bright-blue)))
   `(org-link ((,c :foreground ,bright-blue :underline t)))
   `(org-drawer ((,c :foreground ,bright-cyan)))
   `(org-ellipsis ((,c :foreground ,bright-yellow :underline t)))
   `(org-footnote ((,c :foreground ,bright-blue :underline t)))

   `(org-checkbox ((,c :foreground ,bright-white :bold t :weight bold)))
   `(org-checkbox-statistics-done ((,c :foreground ,bright-green :bold t :weight bold)))
   `(org-checkbox-statistics-todo ((,c :foreground ,bright-red :bold t :weight bold)))
   `(org-done ((,c :foreground ,bright-green :bold t :weight bold)))
   `(org-todo ((,c :foreground ,bright-red :bold t :weight bold)))
   `(org-headline-done ((,c :foreground ,bright-green :bold t :weight bold)))
   `(org-date ((,c :foreground ,bright-green)))
   `(org-date-selected ((,c :foreground ,bright-black :background ,bright-red)))

   `(dockerfile-image-name ((,c :foreground ,bright-green)))

   `(mode-line ((,c :background ,black :foreground ,bright-white)))
   `(mode-line-inactive ((,c :background ,black :foreground ,bright-grey)))
   `(region ((,c :background ,magenta)))

   `(swiper-line-face ((,c :foreground ,bright-cyan)))

   `(ivy-current-match ((,c :foreground ,bright-magenta)))
   `(ivy-minibuffer-match-face-1 ((,c :foreground ,bright-magenta :bold t :weight bold)))
   `(ivy-minibuffer-match-face-2 ((,c :foreground ,bright-magenta :bold t :weight bold)))
   `(ivy-org ((,c :foreground ,bright-white)))
   `(ivy-confirm-face ((,c :foreground ,bright-green)))
   `(ivy-match-required-face ((,c :foreground ,bright-red)))
   `(ivy-remote ((,c :foreground ,bright-black :background ,bright-magenta)))

   ;; Dired
   `(dired-directory ((,c :foreground ,bright-blue)))
   `(dired-flagged ((,c :foreground ,bright-red)))
   `(dired-header ((,c :foreground ,bright-magenta)))
   `(dired-ignored ((,c :foreground ,bright-grey)))
   `(dired-mark ((,c :foreground ,bright-green)))
   `(dired-marked ((,c :foreground ,bright-yellow)))
   `(dired-perm-write ((,c :foreground ,magenta)))
   `(dired-symlink ((,c :foreground ,bright-magenta)))
   `(dired-warning ((,c :foreground ,bright-red)))

   ;; Company
   `(company-echo-common ((,c :foreground ,bright-red)))
   `(company-template-field ((,c :foreground ,bright-yellow)))
   `(company-tooltip-mouse ((,c :foreground ,bright-magenta :background ,black)))
   `(company-tooltip ((,c :background ,bright-black :foreground ,bright-white)))
   `(company-tooltip-search ((,c :background ,bright-black :foreground ,bright-cyan)))
   `(company-tooltip-search-selection ((,c :background ,bright-black :foreground ,bright-cyan)))
   `(company-tooltip-selection ((,c :background ,bright-black :foreground ,bright-magenta)))
   `(company-tooltip-common ((,c :foreground ,bright-blue)))
   `(company-tooltip-annotation ((,c :foreground ,bright-magenta)))
   `(company-scrollbar-bg ((,c :foreground ,bright-black)))
   `(company-scrollbar-fg ((,c :foreground ,bright-magenta)))
   `(company-preview ((,c :foreground ,bright-magenta)))
   `(company-preview-common ((,c :foreground ,bright-magenta)))
   `(company-preview-search ((,c :foreground ,bright-red)))

   `(git-gutter:modified ((,c :foreground ,bright-magenta)))
   `(git-gutter:added ((,c :foreground ,bright-green)))
   `(git-gutter:deleted ((,c :foreground ,bright-red)))

   ;; Doom Modeline
   `(doom-modeline-bar ((,c :background ,bright-magenta)))
   `(doom-modeline-inactive-bar ((,c :background ,bright-grey)))
   `(doom-modeline-buffer-major-mode ((,c :foreground ,bright-green)))
   `(doom-modeline-buffer-path ((,c :foreground ,bright-magenta)))
   `(doom-modeline-buffer-file ((,c (:foreground ,bright-magenta))))
   `(doom-modeline-buffer-modified ((,c (:foreground ,bright-magenta))))
   `(doom-modeline-project-root-dir ((,c (:foreground ,bright-white))))
   `(doom-modeline-project-parent-dir ((,c (:foreground ,bright-white))))
   `(doom-modeline-project-dir ((,c (:foreground ,bright-green :bold t :weight bold))))

   `(doom-modeline-highlight ((,c (:foreground ,bright-blue))))
   `(doom-modeline-info ((,c (:foreground ,bright-magenta))))
   `(doom-modeline-urgent ((,c (:foreground ,bright-red))))
   `(doom-modeline-warning ((,c (:foreground ,bright-yellow))))
   `(doom-modeline-panel ((,c (:box ,bright-magenta))))

   `(doom-modeline-evil-emacs-state ((,c (:foreground ,bright-magenta))))
   `(doom-modeline-evil-insert-state ((,c (:foreground ,bright-red))))
   `(doom-modeline-evil-motion-state ((,c (:foreground ,bright-yellow))))
   `(doom-modeline-evil-normal-state ((,c (:foreground ,bright-green))))
   `(doom-modeline-evil-operator-state ((,c (:foreground ,bright-blue))))
   `(doom-modeline-evil-replace-state ((,c (:foreground ,bright-red))))

   ;; Evil
   `(evil-ex-commands ((,c (:foreground ,bright-white :slant italic))))
   `(evil-ex-info ((,c (:foreground ,bright-green))))
   `(evil-ex-substitute-replacement ((,c (:foreground ,bright-red))))

   ;; Flycheck
   `(flycheck-error ((,c :underline (:color ,bright-red :style wave))))
   `(flycheck-info ((,c :underline (:color ,bright-blue :style wave))))
   `(flycheck-warning ((,c :underline (:color ,bright-yellow :style wave))))
   `(flyspell-duplicate ((,c :underline (:color ,bright-red :style wave))))
   `(flyspell-incorrect ((,c :underline (:color ,bright-red :style wave))))
   `(flycheck-error-list-filename ((,c :foreground ,bright-white :bold t :weight bold)))
   `(flycheck-error-list-checker-name ((,c :foreground ,bright-cyan)))
   `(flycheck-error-list-highlight ((,c :foreground ,bright-cyan)))
   `(flycheck-error-list-error ((,c :foreground ,bright-red)))
   `(flycheck-fringe-error ((,c :foreground ,bright-red)))

   `(magit-diff-added ((,c :foreground ,bright-green :background ,green)))
   `(magit-diff-added-highlight ((,c :foreground ,bright-black :background ,green)))
   `(magit-diff-base ((,c :foreground ,bright-white)))

   ;; highlight-indent-guides
   `(highlight-indent-guides-character-face ((,c :foreground ,magenta)))
   `(highlight-indent-guides-even-face ((,c :foreground ,magenta)))
   `(highlight-indent-guides-odd-face ((,c :foreground ,magenta)))
   `(highlight-indent-guides-top-character-face ((,c :foreground ,bright-magenta)))
   `(highlight-indent-guides-top-even-face ((,c :foreground ,bright-magenta)))
   `(highlight-indent-guides-top-odd-face ((,c :foreground ,bright-magenta)))
   `(highlight-indent-guides-stack-character-face ((,c :foreground ,bright-magenta)))
   `(highlight-indent-guides-stack-even-face ((,c :foreground ,bright-magenta)))
   `(highlight-indent-guides-stack-odd-face ((,c :foreground ,bright-magenta)))

   ;; package
   `(package-name ((,c :foreground ,bright-magenta :underline t)))
   `(package-description ((,c :foregronud ,bright-white)))
   `(package-help-section-name ((,c :foreground ,bright-cyan)))

   `(yaml-tab-face ((,c :foreground ,bright-black :background ,bright-red)))
   )
  )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'neon-night)

;;; neon-night-theme.el ends here
