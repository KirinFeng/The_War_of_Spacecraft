# The War of Spacecraft

A 2D vertical shooter built with [Processing](https://processing.org/) (Java mode). Defend against waves of falling enemies, collect power-ups, level up and defeat the boss. Supports single-player and local two-player mode.

## Requirements

- Processing 3 or 4
- [Minim](https://code.compartmental.net/minim/) sound library (install via *Sketch → Import Library → Manage Libraries*, search "Minim")

## How to run

1. Clone or download this repository. The folder name must stay `The_War_of_Spacecraft` (Processing requires the folder name to match the main sketch file).
2. Open `The_War_of_Spacecraft.pde` in Processing.
3. Click **Run**.

## Controls

| Action | Player 1 | Player 2 |
|---|---|---|
| Move left / right | `A` / `D` | `J` / `L` |
| Jump | `W` | `I` |
| Rotate shooting direction | `Q` / `E` | `U` / `O` |

| Key | Function |
|---|---|
| `B` | Pause / resume |
| `R` | Restart |

Shooting is automatic. Use the menu buttons on the home page for Start, MultiPlayer, Setting (music, background, skin), Help, About and Exit. The arrow in the top-left corner returns to the home page.

## Gameplay

- Each enemy destroyed adds 1 point; every 10 points advances one level. Enemies get smaller and faster at higher levels.
- Level 6 is the boss fight. Reduce the boss health bar to zero to win.
- You lose a life when an enemy reaches the bottom of the screen or a boss projectile hits you. The game ends when life drops below zero.
- From level 3, extra teleport bars appear at the bottom of the screen that temporarily boost movement speed.

### Power-ups

| Icon | Effect |
|---|---|
| Power | More ammo (spread shot) |
| Snow | Freeze enemies and other items |
| Shield | Temporary shield that blocks damage |
| Heal | Restore 5 life |
| Moving Speed | Increase movement speed |

## Project structure

| File | Purpose |
|---|---|
| `The_War_of_Spacecraft.pde` | Main sketch: setup, game loop and all pages |
| `Enemy.pde` | Enemy (`Peo`) |
| `Bullet.pde` | Player bullet (`Ball`) |
| `Friend.pde` | Player 2 bullet (`Player2Ball`) |
| `Boss.pde` | Boss projectile (`Boos`) |
| `Youjun.pde`, `Frozen.pde`, `Shield.pde`, `Heal.pde`, `Speed.pde` | Power-ups |
| `move.pde`, `keyPressed.pde`, `keyReleased.pde`, `mousePressed.pde` | Input handling |
| `data/` | Images and background music |

## Credits

Yuanqi Feng, Yuanbin Chang, Haozheng Wang
