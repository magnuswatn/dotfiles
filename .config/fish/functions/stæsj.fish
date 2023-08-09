function stæsj
    if [ $(math $(git diff --staged --name-only | wc -l)) = 0 ]
        git add -A
    end
    git commit -m stæsjet --no-gpg-sign --no-verify
end
