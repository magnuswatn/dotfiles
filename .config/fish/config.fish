if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

# Exclude dependencies newer than 14 days
set -gx UV_EXCLUDE_NEWER P14D

# Don't allow installation of packages into
# the global Python env
set -gx PIP_REQUIRE_VIRTUALENV 1
