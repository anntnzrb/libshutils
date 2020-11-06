<!-- markdownlint-disable MD013 MD033 -->

# libshutils

collection of POSIX-compliant shell scripts

## purpose

the main goal is to create simple and minimal programs

more on this @ [philosophy](#philosophy)

## collection

list of current programs with a short description

<details>
  - `die` :: prints a message to **stderr** & exits with non-successful code `1`
  - `is_installed $cmd` :: check if `cmd` is installed
  - `is_net` :: checks if there is an active internet connection
  - `is_running $prg` :: checks if `prg` is currently running
  - `is_su` :: checks if invoking user is a super-user
</details>

## philosophy

create simple tools focused on simplicity and minimalism

> ...designing simple software is far more difficult... however one has to pay
> this price to achieve reliability and maintainability

## coding standards

- linter :: [shellcheck](https://0x0.st/QQ)
- formatter :: [shfmt](https://0x0.st/ZIsC)

all links should be shortened with [0x0.st](https://0x0.st) to reduce verbosity

## acknowledgments

<details>
  | 📚                                   | ✒                                                         |
  | ------------------------------------ | --------------------------------------------------------- |
  | [pure sh bible](https://0x0.st/ZK4C) | [![dylanaraps](https://0x0.st/ZIsL)](https://0x0.st/ZIrO) |
  | -                                    | [![Luke Smith](https://0x0.st/ZIsp)](https://0x0.st/ZIsf) |
</details>
