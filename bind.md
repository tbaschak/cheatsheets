---
title: BIND
category: CLI
---
## General BIND Tasks

### Reload BIND

```
rndc reload
```

### Reload BIND Configs

```
rndc reconfig
```

## Recursive BIND Server Tasks

### Flush Cache

```
rndc flush
```

### Flush Domain or Record

Flush the given name from the server's cache(s)

```
rndc flushname <name> [view]
```

Flush all names under the given name from the server's cache(s)

```
rndc flushtree <name> [view]
```

## Authoritative BIND Server Tasks

### Freeze Zone

```
rndc freeze <name>
```

### Thaw Zone

```
rndc thaw <name>
```

