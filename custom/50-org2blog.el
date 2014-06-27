;; Org2blog mode
(require 'org2blog-autoloads)

;; Read password
(require 'netrc)
(setq blog (netrc-machine (netrc-parse "~/.netrc") "2014roundtheworld" t))

;; Login details for my round the world blog 2014
(setq org2blog/wp-blog-alist
      '(("2014roundtheworld"
         :url "http://2014roundtheworld.wordpress.com/xmlrpc.php"
         :username (netrc-get blog "login")
         :password (netrc-get blog "password"))))


