;;; Yahoo 
;;
;; KEY    dj0yJmk9ZHBRUmVXc2FCaEhFJmQ9WVdrOWVrRk9jVlpCTkRnbWNHbzlNakF5TnpZeU1EYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD04ZQ--
;; SECRET 5484f4f1f7f19f5d974ba53b42aabad80ee09f40
;; APP-ID zANqVA48
;;

(setq api-key-yahoo (list  "dj0yJmk9SzhWT1Jyck92cnRVJmQ9WVdrOU5EVXpiRzl4TXpZbWNHbzlNemMzTXpNeU16WXkmcz1jb25zdW1lcnNlY3JldCZ4PWQ3"
                           "db6758f641acc8e61917f452ce1c5e9e1c06c198"                           
                           "https://api.login.yahoo.com/oauth/v2/get_request_token"
                           "https://api.login.yahoo.com/oauth/v2/request_auth"
                           "https://api.login.yahoo.com/oauth/v2/"))
(defun auth-yahoo ()
    (interactive)

    (let* ((api-key api-key-yahoo)
           auth oauth-authorize-app (car api-key-yahoo)
           (cadr api-key-yahoo)
           ;; REQUEST-URL is the url to request an unauthorized token.
           "https://api.login.yahoo.com/oauth/v2/get_request_token"
           ;; ACCESS-URL is the url to request an access token.
           "https://api.login.yahoo.com/oauth/v2/get_token" ; access-url
           ;; AUTHORIZE-URL is the url that oauth.el should redirect
           ;; the user to once it has recieved an unauthorized token.
           "https://api.login.yahoo.com/oauth/v2/" ; authorize-url 

                                      
           )
      auth))

