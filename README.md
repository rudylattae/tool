# tool
A collection of daily driver and niche tools.

This repo is designed to be plugged into a [hi](https://github.com/rudylattae/hi) as a package or run directly via [just](https://github.com/casey/just).

## Use with `hi`

On Unix (Linux, MacOS), install `tool` as a package with `hi pkg add`.

```sh
hi pkg add tool rudylattae/tool "Manage (install/uninstall) tools"
```


On Windows you will have to do this manually, first clone the repo

```sh
> hi repo clone rudylattae/tool
```

Then add the root `rudylattae/tool/justfile` to your `main.justfile` as a module

```sh
> hi edit-justfile
```

Add the following, adjust for the path where the package repo was cloned to.
```
# Manage (install/uninstall) tools
mod? tool '~/hi/github.com/rudylattae/tool/justfile'
```