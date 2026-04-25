# Platform Godot — 2D Platformer

[![Godot](https://img.shields.io/badge/Godot-3.x-blue?logo=godot-engine)](https://godotengine.org/)
[![GDScript](https://img.shields.io/badge/Language-GDScript-478CBF)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![Export](https://img.shields.io/badge/Export-HTML5%20%7C%20Desktop-green)]()
[![Status](https://img.shields.io/badge/Status-Complete-brightgreen)]()

![screenshot](captura.png)

A 2D platformer built with **Godot Engine 3** and GDScript. Features physics-based character movement, animated sprites, tilemap-based level design, and a working HTML5 export playable in the browser.

---

## Features

- **Physics-based movement** — jump, run, and fall using Godot's `KinematicBody2D`
- **Animated sprites** — idle, run, and jump animations via `AnimationPlayer`
- **Tilemap levels** — levels built with Godot's TileMap system
- **Global state** — `Global.gd` autoload for cross-scene data persistence
- **HTML5 export** — playable in the browser without installing Godot
- **Multiple levels** — progression through distinct level scenes

---

## Getting Started

**Option A — Play in browser:**

Open the exported build directly from the `Export/` folder — no installation needed.

**Option B — Open in Godot:**

1. Install [Godot Engine 3.x](https://godotengine.org/download)
2. Clone the repository:
```bash
   git clone https://github.com/NicoRuedaA/Platform_Godot.git
```
3. Open Godot → **Import** → select `project.godot`
4. Press **F5** to run

---

## Controls

| Input | Action |
|---|---|
| `A` / `D` or Arrow keys | Move left / right |
| `Space` or `W` / Up | Jump |

---

## Project Structure

```
├── Animations/      # AnimationPlayer resources
├── Background/      # Background sprites and scenes
├── Export/          # HTML5 and desktop build output
├── Levels/          # Level scenes
├── Objects/         # Interactable objects (coins, platforms...)
├── Scripts/         # GDScript gameplay logic
├── Sprites/         # Character and world spritesheets
├── Global.gd        # Autoload — global state management
└── project.godot    # Godot project entry point
```

---

## Context

Built as a learning project to explore core Godot concepts: scene tree architecture, `KinematicBody2D` physics, `AnimationPlayer` state management, and the TileMap workflow for level design. The HTML5 export pipeline was also configured to make the game playable without needing Godot installed.

---

Developed by [Nico Rueda](https://github.com/NicoRuedaA)
