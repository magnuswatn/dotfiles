function purgeLocalBranches
    set -l main_branch $(git branch --list master main --format="%(refname:short)")
    for branch in $(git branch --merged "origin/$main_branch" --format="%(refname:short)")
        if [ "$branch" != "$main_branch" ]
            git branch -D "$branch"
        end
    end
end
