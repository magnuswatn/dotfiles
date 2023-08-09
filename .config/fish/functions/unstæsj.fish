function unstæsj
    set -l last_commit_msg $(git log -1 --pretty=%B)
    if [ "$last_commit_msg" != "stæsjet " ]
        echo "Last commit is not a 'stæsj' commit. Can't unstæsj"
        return 1
    end
    git reset HEAD~1
end
