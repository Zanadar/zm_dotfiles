function vkl -d "Load ssh_key"
    argparse 'n=?' 't=?' -- $argv
    set -q n
    or set n my-ssh-key
    set -q t
    or set t 8

    /usr/bin/ssh-add -D
    op get item $n | jq -r .details.notesPlain | /usr/bin/ssh-add -t {$t}H -
end
