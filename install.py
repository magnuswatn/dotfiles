from pathlib import Path


HOME = Path.home()


def make_sure_symlink_in_home_exists(fil: Path) -> None:
    home_folder_variant = HOME.joinpath(fil)
    if not home_folder_variant.exists():
        print(f"Symlinking to {fil} from home")
        home_folder_variant.symlink_to(fil.absolute(), fil.is_dir())
        return

    if not home_folder_variant.is_symlink():
        print(f"{fil} already exists as standalone file in home. Manual fix needed")
        return

    # assuming everything is ok here now


def main() -> None:
    for fil in Path(".").glob(".*"):
        if fil.name in (".gitignore", ".git", ".*.swp"):
            continue

        if fil.name == ".config":
            for sub_fil in fil.iterdir():
                make_sure_symlink_in_home_exists(sub_fil)
            continue

        make_sure_symlink_in_home_exists(fil)
    print("Done")


if __name__ == "__main__":
    main()
