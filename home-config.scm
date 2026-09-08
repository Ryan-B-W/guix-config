;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services gnupg)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages polkit)
  #:use-module (gnu system shadow))

(define home-config
  (home-environment
    (services
      (append
        (list
          (service home-bash-service-type)

          (service home-dbus-service-type)
          (service home-pipewire-service-type)

          (service home-files-service-type
           `((".guile" ,%default-dotguile)
             (".Xdefaults" ,%default-xdefaults)))

          (service home-xdg-configuration-files-service-type
           `(("gdb/gdbinit" ,%default-gdbinit)
             ("nano/nanorc" ,%default-nanorc)))

          (service home-gpg-agent-service-type
                   (home-gpg-agent-configuration
                    (ssh-support? #t)
                    (extra-content "allow-emacs-pinentry\nallow-loopback-pinentry\nwrite-env-file\nuse-standard-socket")))
          (service home-openssh-service-type
                   (home-openssh-configuration
                    (hosts (list
                            (openssh-host (host-name "*")
                                          (port 22)
                                          (extra-content "ServerAliveInterval 120"))
                            (openssh-host (name "sdf.org")
                                          (host-name "sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "sdf tty.sdf.org")
                                          (host-name "tty.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "meta meta.sdf.org")
                                          (host-name "meta.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "ma ma.sdf.org")
                                          (host-name "ma.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "faeroes faeroes.sdf.org")
                                          (host-name "faeroes.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "iceland iceland.sdf.org")
                                          (host-name "iceland.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "sverige sverige.sdf.org")
                                          (host-name "sverige.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "miku miku.sdf.org")
                                          (host-name "miku.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "miku miku.sdf.org")
                                          (host-name "miku.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "asimov asimov.home.ryanbw.org")
                                          (host-name "asimov.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                             (user "brody")
                                                             (port 2222))))
                            (openssh-host (name "asimov.local")
                                          (host-name "asimov.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "verne")
                                          (host-name "verne")
                                          (user "u0_a154")
                                          (port 8022))
                            (openssh-host (name "hoar hoar.local")
                                          (host-name "hoar")
                                          (user "brody"))
                            (openssh-host (name "shelley")
                                          (host-name "shelley")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                             (user "brody")
                                                             (port 2222))))
                            (openssh-host (name "shelley.local")
                                          (host-name "shelley")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "glass-wall glass-wall.tgfoffice.ryanbw.org")
                                          (host-name "glass-wall.tgfoffice.ryanbw.org")
                                          (user "security"))
                            (openssh-host (name "hugo hugo.home.ryanbw.org")
                                          (host-name "hugo.home.ryanbw.org")
                                          (user "brody")
                                          (port 2222))
                            (openssh-host (name "adams adams.home.ryanbw.org")
                                          (host-name "adams.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                             (user "brody")
                                                             (port 2222))))
                            (openssh-host (name "adams.local")
                                          (host-name "adams.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "github github.com")
                                          (host-name "github.com")
                                          (user "git"))))
                    (known-hosts *unspecified*)
                    (known-hosts2 (list
                                   "[hugo.home.ryanbw.org]:2222 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ZcqphH8urTs0312v+nShHjrqdd3NGltTa57oHJBrn"
                                   "[home.ryanbw.org]:2222 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ZcqphH8urTs0312v+nShHjrqdd3NGltTa57oHJBrn"
                                   "asimov ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNWP/7GU94UY+zGi6MHZS3cBtDGba+hdvja9IeajDE0xo4Dh1PKajKOf4nAD1KhMuB6pBrVSdQLx8cIDBH39z2E="
                                   "asimov.home.ryanbw.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNWP/7GU94UY+zGi6MHZS3cBtDGba+hdvja9IeajDE0xo4Dh1PKajKOf4nAD1KhMuB6pBrVSdQLx8cIDBH39z2E="
                                   "asimov.local ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNWP/7GU94UY+zGi6MHZS3cBtDGba+hdvja9IeajDE0xo4Dh1PKajKOf4nAD1KhMuB6pBrVSdQLx8cIDBH39z2E="
                                   "adams ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYFI6KeRoNtvkGCMACJmvRC7AaSzGVn49cl+fuHN2PK"
                                   "adams.home.ryanbw.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYFI6KeRoNtvkGCMACJmvRC7AaSzGVn49cl+fuHN2PK"
                                   "adams.local ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYFI6KeRoNtvkGCMACJmvRC7AaSzGVn49cl+fuHN2PK"
                                   "adams.home.ryanbw.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDPW7iErqpJ7m8wWGTI0fV9f1NgbldH1kcoNjxANcsqQIHdATU7MowSKzToI4bFhuWkLofthrlCG7YkvyYWORo8="
                                   "shelley ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBjmln6sNbtNTNCa89DrIyfOyJ5xfzo74jHm/XUeeKsMs3AqGW4z9gqi+zbUma7FQBKl+/io6vmaHkPOVE89xKk="
                                   "shelley.home.ryanbw.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBjmln6sNbtNTNCa89DrIyfOyJ5xfzo74jHm/XUeeKsMs3AqGW4z9gqi+zbUma7FQBKl+/io6vmaHkPOVE89xKk="
                                   "shelley.local ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBjmln6sNbtNTNCa89DrIyfOyJ5xfzo74jHm/XUeeKsMs3AqGW4z9gqi+zbUma7FQBKl+/io6vmaHkPOVE89xKk="
                                   "clockworkpi-a06 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/Y/iS+7qsU2MiO3XRUuejQ5H6VHobGy+WTwiFC0ujo"
                                   "clockworkpi-a06 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFXvydp9wtUofa5T69q0fF1GFe/D0kBhuO9a37P0QWuIOjC/E559rQVVRi5NW9ZwxDa3pgIExfuJHnxJhbFKkeA="
                                   "clockworkpi-a06 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn7c0nK7zevvjjmsgh9rsX6e8EqXk9vfK0UvcsEXxiZSi9Pby0br+3/Ih9TVGtS/iXNJUijCxcOrrAdP7jecHA0YwA0XnEGDSCJ6D7rTvnK8rVcFGlqOK1hneNwcSaRjctY4qdur2CMePnapTvvIM59G3ogbbxObOEAyiwV1XxICH7vpAl0Bwn3w7zg08a8lPXyck7cHNTKxKzGXelz3Vp2Cv1AAiBaNhIsRWfiwSd/Y0CnJy4Sj79ixJzQDnvrUwz+N6GyDRVLeIshij891D1diMhAZX6F1tCBwBbqIYr9mFS2Pl2MNgF06G28FbJuPgz1qd3ovrAw2TLA3ZpYnypcLPtP9D8sUV26uD88hLtwIFpcZ39br93Tsd4JZfROkxDxqbp6ogsIHZHHQjLo0PsuZ670uP+Q6tyEaEKvejqR03OvDuy9kyIOsVbey3LSuqeU65zpOfjmsmwf/yDHhpcSKvlYbYE3PlLnKYZ3viQw8rITrOGblM6DvsIW876dvU="
                                   "glass-wall ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMUhOA5M5a3FnlomXdfTtOPX6+Jvo9romx965rkG7weV"
                                   "glass-wall.tgfoffice.ryanbw.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMUhOA5M5a3FnlomXdfTtOPX6+Jvo9romx965rkG7weV"
                                   "sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "tty.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "meta.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "ma.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYd/fxnh/aZm2mAvZyCJn23A8sN7I8VZamIbamWtm/z"
                                   "ma.sdf.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCZnLf53oW9TGxXOsAPFtSeygukVQTHWNdOsV5WFK5HCbDjpJWdSD+YL9vWMdFUybJGgizrs4poiR0YIikqUjdS1GUJiL+JN61sOJJ678X75yON0Hdky9BPqOLiIx4hcih6VQMDQysXyYRGlouTUYbNNCK3GokbmnpuYniGfqF8lDZ6MovIBiGRtvdt6DOq2PYcqNo8l9a6S46Z4mHFgdXTkMtJxcHg1wOjzuYBEZCDt7TpuWBcf3kYRaLZdKzniV1ACLQ1BK7h2AkXUoLpll2628VKY3jqFWILk0O1dV7VhWK9Gu4pNG45jfLWDwNe0cJbresU+TEYOqUXOfibFgYVhjVGV55Ztk0ochfFi+EM8v2Z1wdyouoWBRgk1HWauAJJLOL5HodF88XQi47+x2cqBj4bLMNk5aVn44q6Ff03iLVHX27Svg6nwiCYdkd8LD8okUudxO/Dw/NEYXvLoHSxaZgjrcp4BLZ6kj4rNgIuhVAUiAj2LySnah/TR15sug8="
                                   "ma.sdf.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKChFj75RhAAwW/yQBLFZTBwLNJ6C3/DjCpZz+ATTea5RiVQ+/YMpED0GZ+877Tx0XXCbARjN0cLhWrOlPc8tCQ="
                                   "faeroes.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "iceland.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "sverige.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "miku.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17"
                                   "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
                                   "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
                                   "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk="
                                   "gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf"
                                   "gitlab.com,2606:4700:90:0:f22e:fbec:5bed:a9b9 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY="
                                   "sfo2.tmate.io ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTnCMAanvAYXe8RSbSgpz2agNiU2i2Y2ryPWeFx+yh473Aj0zW6x/BzApOn5k4qiPmf8LOVSIk5hL01W8l2y5yHC2CXFyBpQuc/uNZzLpAxrvTSVN1rp7hu3dR5keybHFdd8SEWlPI4m9vPYUVqXMrXBjfsSZxeYOUKNav3aWWPGtO19KhmCdMbIZx3PN0QvklhkJ2ElRZO7uiACvvCWS8LOo3ht/Y6QdGIfQqTX3DJlFXwfvnoqhlmV8LGVKk/y6jtqPmmengEEHtvRcH92LzBIR5e0NQj+5/WDHquh1p9xiaA3TZD6zStWSrbqFovm7aAAM9WKfb866WkUK1HlNv"))
                    (authorized-keys (list
                                      ;; Personal Yubikey.
                                      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8DFytpc6sozHtEwBMf3dnId+pxWJkuKNYWaAGZgEf+pm56G/sxzKN1oUw67ja4i+t9/w11jXZNFMVCtG33HgqkzSevk0itJ+q60cML/ZlX4J7dSup8kT8Bqjyr2Nqd5SVTRu2DWQ27kHLq/40xheGlWdjEnF6r5n5Rmeday45lIh8UPqkCXd41Y8YqZI8wKvr2LHwsd4jShaNrizWJ7lOX2DDgvBkZCBXwPXueue+wXVP1jwPvfBStRP67jPNKl4IoNVfgkESNM8/uGeoknVBV7mELmEHq4rcp3G9KUSpeHCfLcz7KXX+uSweBY0Wm7wbGJlFK19cVfuPAeAj0G5oVowkbIvpVgPBMPayliNxjpyUefGUmnqVYcDcZgf5LhaJfGdfn7jcpGoSL1F2OgOa+QFAv5UjfLT1nzKj2TL+lnvj+T+mK+awFb1jPKCu6NfIYKGIynH7fSVcdxPnwwYZoU7XZLBQDH1z9EweUjzPnmnk9goJERAJLWr457DOnSOtAe4G6AHALY7pjxfLRxoIhW7pnXQJvq9a2kJpU8VmMsxa8UKDMPJBZaLKMZcslAVo2kQN8haKXsCG53tkNxc9mCj8M9JM3y15Wy05X9803PGMkOtH3SWDBiWD69lwqOVjxU7actgwcjS4m83yidamkEKSmDVEJeCG/UWiu1uqlQ== cardno:000607082686"
                                      ;; Personal computers and devices keyfiles.
                                      ;"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC542y3gp2Q4JMD82p6HTNUB9uZ9xu3TAnRWP4YaLqvzSpAd3Bx1LK/U4e4A+0KdDuGjOz8tjhdvD2jYxpBeIO3TaMK+xhf8So6+2uEfvuNNXL0og0pntyNxTdo4cvszw0WTyzo/yaNf+Fc0ZhC67uinUHvRkcNxI3NPXuY9bHpxYgqSu3Bvuynj/9cTUGEUlZdW7hf7dNdT9xnGZMynNwPOmwCCNHV0gET80pejPnpgac7VH6VecIfSUtlYcUarawIMVj9IozFdFRYlkunAYp/2tt/qmGawo95EoS6Ze+pA88ot5rCgwwAqXcrs8ul9mgefg0lK4oqcVyur6ic1oNF brody@asimov.home.ryanbw.org"
                                      ;"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2fvc4VTUfA46B2eC9qMrquvLhR8VOEMRu5fanKZXloGb010EviveUTHh2PuMi0B7Y+RW39Tullg6/wXTQC2XZSwvrWqBM/qoaXmP3tfNjg8Ajg8MthInDNaHUSXMOwo936wCi7SyX0jOz+o+AFtJ6nqtIYsnnZIS7HXCPOJIKmVyYbMaF0ot7XwXEjG2wxu3wjzHmZb4fa0vTd8qE4HsPPBD34WFgte2sUFBH6TUqzTKnGvEq0nJP5WubZe5jJCsaQ9h6WyYsc4pHUMrijhv2YfBli3UZgSVeFrENyR95Ia3fsbQpIiAauftd+cHZVVOXC2RJzBypvuzwBdkxaror brody@shelley.home.ryanbw.org"
                                      ;"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdRmy5aaO3kUmk8qh5wNAjPbOgzE7bf58kdVvrmGOvykgG4ZZL2wCRwcMkVAkTzOt7ER6UrHFM7CflQYOh+0aJgzC/hLBUQqtL6Y0+yzwi1fgYQt1UGzchwvHvBAnE0JuE07xJlq7D5JmkeevpWMwC9Dx90YwqFt0c4dJMdUerH2uSSaC/oqIbSOpO56O2Nn4+DCUWMMHAA/AfSNYKUG8Dj6eUBkDIOjDU37SPO05g7aIUhdjoxTLmwy1Z/eVmXzfh5yP/NJBaFCEoTbrFpOZnIGfaa0R+x0wsjGxxp6aiuEBA0pxO6xM/M1Pi0JIkdCsfpaLPQnVL9V0x7q7uOIUH brody@phone.mobile.ryanbw.org"
                                      ;"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+8E3DepSvDHQjTNrim07bZqgX/uFwQrOmZp/PHDDF4jCnBVYMqT3n7yWzH2eaZzhegB4GPt23Bmo5HB+nRUcj1qPNATenXBxIk2IoIPPq21dIPlKmKQyXKXCkjtlo/gXuvLRy6aj0B16hVN0NDFuRZ/wEAseXLMxg3Gln5/lalzNRt/VwhS2VBlRPJnnIGLXTOb52AmXDBZPbkfUYYE+mOC76ySA8NrL/rrOLwZXCezq2J+sskvA2+XAhqTdZi8dk23TpviY8qtNpoj3QXJrS+G5zFVhyeAr8rPCAbAgYwuCaPk82t35YTlsIj0Nxqlqo01s4HwLcHyXUiAWtltObWmt8dNc6v8wnWt5kAtcglnX/bF0SqkUPo33421f+ZLkWbIu6xeudTilDnTbLf6YXNcbss+g4BtwR3dvadzbVDqdGW7CPd2zSZZcaxQtIFX4wu/MYE5ZwY26/b37/dVhimJHObvwSJRHMl2vS8Vg0pKqyhs8LEpW1O4BmV4Fkaj+BwTIJBvVnTtKA8no8NUtZPPcjkuA1nHmrZhDB+em9liHDOPziDKk4slYyV7fBRo5lJfB8j3ElrLHyOwWzit706PLsJqVosBkh7Ha4Jq0QJr/ohh/hOC81b8eCO5BzCjYdpg9FaaZ9hOWRk1KwzKqAu74S1DnW5e+k59mHtjrqGQ== Brody's OnePlus 7 Pro"
                                      ))
                    (add-keys-to-agent 'confirm))))

        %base-home-services))))

home-config
