# figureControlMatlab

MATLAB helpers to place figures in a tiled grid across one or more monitors instead of stacking them in the same spot.

**Typical workflow**

1. **Once at the start of a script** — Build a settings struct and call `figureInitiate` to get the `figs` state (screen layout, counters, defaults).
2. **Before each new figure** — Call `figOpen(figs)` and use the returned `figs` for the next call. Optionally capture the figure handle from the second output.

`figureControl(figs)` is a thin wrapper that only calls `figOpen`; prefer **`figOpen`** in new code.

## Minimal example

```matlab
% Figure initialization (once)
figs.screens = 2;
figs = figureInitiate(figs);

% Each new figure: advance placement, then plot into current figure
[figs, figName] = figOpen(figs);
plot(rand(1000, 1));
title('Figure 1');

[figs, figName] = figOpen(figs);
plot(rand(1000, 1));
title('Figure 2');

% ... repeat for more figures (default layout assumes up to 6 slots per screen)
```

If you do not need the handle, `figs = figOpen(figs);` is enough.

## Monitor arrangement

Side-by-side monitors use the default. For **vertically stacked** monitors, set this before `figureInitiate`:

```matlab
figs.monitorArrangement = 'vertical';  % default is 'horizontal'
figs.screens = 2;
figs = figureInitiate(figs);
```

See `figureInitiate.m` for how the placement matrix is built.

## Settings (overview)

Pass a struct into `figureInitiate`; any field you set overrides defaults. Common fields:

| Field | Role |
|--------|------|
| `screens` | Number of monitors to spread figures across |
| `monitorArrangement` | `'horizontal'` (default) or `'vertical'` |
| `size` | Figure layout mode: `'normal'`, `'tall'`, `'long'`, `'double'`, `'extra long'`, `'full'` |
| `plot` | Set to `0` to skip opening figures (e.g. when plotting is disabled inside a function under test) |
| `trackFigs` | Set to `1` to store figure handles in `figs.figures` |

The default grid assumes **six** figures per screen (`rows`, `cols`, and internal `six` positions in `figureInitiate.m`). Change those defaults if you need a different count or aspect.

## For agents implementing this in user scripts

- Add the repo (or copy these `.m` files) on the MATLAB path.
- Call **`figureInitiate`** once with the user’s `screens` / `monitorArrangement` / `size` as needed.
- Replace bare `figure` calls with **`figOpen(figs)`** and thread **`figs`** through sequential figure creation.
- Use **`[figs, figName] = figOpen(figs)`** when the script needs the figure handle (`figName`) for `axes`, `subplot`, or tests.
