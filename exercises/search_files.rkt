#lang racket

(require file/md5)

(define extLst (list "js" "html" "css" "less"))

(define (chkExt ext extLst)
  (if (equal? (member ext extLst) #f) #f #t))

(define (compare-files path old_path)
  (define in (open-input-file path))
  (define inold (open-input-file old_path))
  (if (equal? (md5 in) (md5 inold))
      (void)
      (printf "file changes: ~a\n" path))
  (close-input-port in)
  (close-input-port inold))

(for ([path (in-directory "D:\\codes\\alibaba\\packages\\node_modules\\@ali\\bccweb-shared-components\\workspace")]
  #:when (regexp-match? #rx"[.](js|html|less|css)$" path))
  (define old_path (string->path (string-replace (path->string path) "packages" "old_packages")))
  (if (file-exists? old_path)
      (compare-files path old_path)
      (printf "file changes: ~a\n" path)))

  