<!-- markdownlint-disable MD013 -->

# libshutils

Collection of POSIX-compliant shell scripts.

## Purpose

The main goal is to create simple and minimal programs.

more on this @ [philosophy](#philosophy)

## Collection

List of current programs with a short description:

| program             | short desc                                                          |
| ------------------- | ------------------------------------------------------------------- |
| `die`               | prints a message to **stderr** & exits with non-successful code `1` |
| `is_installed $cmd` | checks if `cmd` is installed                                        |
| `is_net`            | checks if there is an active internet connection                    |
| `is_running $prg`   | checks if `prg` is currently running                                |
| `is_su`             | checks if invoking user is a super-user                             |

## Philosophy

Create simple tools focused on simplicity and minimalism.

> ...designing simple software is far more difficult... however, one has to pay
> this price to achieve reliability and maintainability.

## Coding Standards

- linter    :: [shellcheck](https://0x0.st/QQ)

All links should be shortened with [0x0.st](https://0x0.st) to reduce verbosity.

## Acknowledgments

| 📚                                   | ✒                                                         |
| ------------------------------------ | --------------------------------------------------------- |
| [pure sh bible](https://0x0.st/ZK4C) | [![dylanaraps](https://0x0.st/ZIsL)](https://0x0.st/ZIrO) |
| -                                    | [![Luke Smith](https://0x0.st/ZIsp)](https://0x0.st/ZIsf) |
