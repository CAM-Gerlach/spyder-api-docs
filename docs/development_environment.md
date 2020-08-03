# Setting the development environment

This sections applies to both setting an environment for contributing to
Spyder as well as creating third party Spyder Plugins.

````{tabs}

```{tab} Unix

This are some instructions on Unix systems (Mac and Linux).
* This are some instructions on Unix systems (Mac and Linux).
* This are some instructions on Unix systems (Mac and Linux).
```

```{tab} Windows

This are some instructions on Windiows systems.
```

````

### Conda (the recommended way)

```{margin} **More information**
(TODO: Link to conda environments.)
(TODO: Link to python environments.)
```

```bash
$ conda create --name spyder-plugin "python=3.8" "spyder=5" --channel conda-forge --yes --quiet
$ conda activate spyder-plugin
```

```{warning} Mixing conda and pip packages
Here is [markdown link syntax](https://jupyter.org)
```