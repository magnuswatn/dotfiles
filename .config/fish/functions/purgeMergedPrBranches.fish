function purgeMergedPrBranches
    set -l recentlyMergedPrs $(gh pr list --state merged --author magnuswatn --json headRefName,headRefOid)
    for row in $(echo "$recentlyMergedPrs" | jq -cr '.[]')
        set -l branch_name $(echo "$row" | jq -r '.headRefName')
        set -l remote_head $(echo "$row" | jq -r '.headRefOid')
        set -l local_head $(git rev-parse --verify --quiet "$branch_name")
        if [ "$local_head" = "$remote_head" ]
            git branch -D "$branch_name"
        end
    end
end
