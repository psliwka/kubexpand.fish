# kubexpand.fish: Sail safe over Kubernetes clusters 🧊🐟

This [fish shell] plugin creates a few handy, dynamically updated
[abbreviations], which are meant to help you navigate over complex [Kubernetes]
deployments, requiring you to keep track of large number of configuration
contexts. These abbreviations cause common Kubernetes management commands, such
as `kubectl` and `helm` to always specify currently used context explicitly,
removing any confusion which might be caused by having them implicitly
configured in advance (with `kubectl config set-context` or e.g. [kubectx]).
Has it ever happened to you to mistakenly blow up your production env when you
thought you were working on the test one? You may want to give _kubexpand.fish_
a try!

[fish shell]: https://fishshell.com/
[abbreviations]: https://fishshell.com/docs/current/interactive.html#abbreviations
[Kubernetes]: https://kubernetes.io/
[kubectx]: https://github.com/ahmetb/kubectx

## Installation

Use your favourite fish plugin manager, for example [fisher]:

```
fisher install psliwka/kubexpand.fish
```

[fisher]: https://github.com/jorgebucaran/fisher/tree/main

## Usage

The plugin should work out of the box. As soon as you type `kubectl ` (note the
trailing space), it'll be replaced with `kubectl --context=<your currently
selected context name>`, from where you can continue to craft your command.

Additionally, `k` is being defined as a shorthand for `kubectl`, so you can
simply type `k ` and have it expanded to a fully qualified `kubectl` invocation
as well.

## Credits

Created by [Piotr Śliwka](https://github.com/psliwka).

## License

[MIT](LICENSE)
