if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

# Don't allow installation of packages into
# the global Python env
set -gx PIP_REQUIRE_VIRTUALENV 1
