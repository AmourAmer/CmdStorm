function 注释
    # TODO comment base on file type
    set -l comment_sign '#'
    echo "$comment_sign#_#_#_#_#"
    sed 's/^/'$comment_sign' /' $argv
    echo "$comment_sign#~#~#~#~#"
end
