function 注释
    set -l comment_sign "$argv[2]"
    echo "$comment_sign ==================="
    sed 's/^/'$comment_sign' /' $argv[1]
    echo "$comment_sign ==================="
end
