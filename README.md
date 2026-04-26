# Platform Godot — 2D Platformer

[![Godot](https://img.shields.io/badge/Godot-3.x-blue?logo=godot-engine)](https://godotengine.org/)
[![GDScript](https://img.shields.io/badge/Language-GDScript-478CBF)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![Platform](https://img.shields.io/badge/Platform-HTML5%20%7C%20Desktop-green)]()
[![Status](https://img.shields.io/badge/Status-Alfa-orange)](https://github.com/NicoRuedaA/Platform_Godot)

![screenshot](/Docs/captura.png)

> **Current Status:** Alfa (En Desarrollo)  
> **Last Updated:** 26-APR-2026

---

## 1. What is Platform Godot?

A **2D platformer** built with **Godot Engine 3** and GDScript. Navigate through levels, defeat enemies using your tongue attack, collect flies, and defeat the boss to win.

- **Physics-based movement** — jump, run, and double-jump using `KinematicBody2D`
- **Tongue attack** — attack enemies with your tongue (Area2D)
- **Enemy types** — flies (moving & static), frogs, and boss encounters
- **Level system** — 5 levels with progression (4 stage levels + boss level)
- **Global state** — `Global.gd` autoload for health and score persistence

**Architecture:** Object-Oriented with Godot's scene system

---

## 2. Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        COMPONENT DIAGRAM                                │
│                                                                         │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐          │
│  │   Player        │  │   Enemy          │  │   Boss           │          │
│  │   (KinematicBody)│  │   (Area2D)      │  │   (KinematicBody)│          │
│  │                 │  │                 │  │                 │          │
│  │  - Movement     │  │  - AI           │  │  - Health       │          │
│  │  - Tongue      │  │  - Damage       │  │  - Patterns     │          │
│  │  - Health      │  │  - Death        │  │  - Death        │          │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘          │
│           │                                                             │
│           │  ┌───────────────────────────────────────────┐              │
│           └──│          Global (Autoload)                │              │
│              │                                           │              │
│              │  - Health management                      │              │
│              │  - Score (flies collected)               │              │
│              │  - Level transitions                      │              │
│              └───────────────────────────────────────────┘              │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 3. Implemented Systems

| System | Status | Description |
|--------|--------|-------------|
| **Player Movement** | ✅ | WASD/Arrow keys, jump, double-jump, run with Shift |
| **Tongue Attack** | ✅ | Space to attack enemies with tongue (Area2D) |
| **Enemy AI** | ✅ | Flies (moving/static), frogs, boss |
| **Health System** | ✅ | 3 lives, knockback, invulnerability frames |
| **Damage Flash** | ✅ | Visual feedback when taking damage |
| **Level Transitions** | ✅ | Progress after collecting 4 flies per stage |
| **Parallax Scrolling** | ✅ | Background movement with ParallaxLayer |
| **Boss Fight** | ✅ | Level 2 boss with attack patterns |
| UI: Lives/Flies Counter | ✅ | On-screen HUD display |

---

## 4. Technical Requirements

| Technology | Version | Notes |
|------------|---------|-------|
| Godot Engine | **3.x** | 3.4+ recommended |
| GDScript | — | Godot's scripting language |
| Export | HTML5 / Desktop | Cross-platform build |

---

## 5. Quick Installation

**Option A — Play in browser:**

1. Download the latest export from Releases OR
2. Open `Export/Practica individual.html` in a browser (requires local server)

**Option B — Open in Godot:**

```bash
# 1. Clone repository
git clone https://github.com/NicoRuedaA/Platform_Godot.git
cd Platform_Godot

# 2. Open in Godot
#    Open Godot → Import → select project.godot
#    Press F5 to run
```

---

## 6. Controls

| Input | Action | Notes |
|-------|--------|-------|
| `A` / `D` or Arrow keys | Move left / right | 8-directional with arrows |
| `W` / `Up Arrow` | Jump | Supports double-jump |
| `Shift` | Run | 2x movement speed |
| `Space` | Tongue Attack | Attack enemies in range |

---

## 7. Project Structure

```
Platform_Godot/
├── Scripts/                    # GDScript gameplay logic
│   ├── playerMovement.gd      # Player movement & attack
│   ├── Character.gd           # Base character class
│   ├── Boss.gd                # Boss AI
│   ├── grua.gd                # Parallax scrolling
│   ├── cameraController.gd    # Camera system
│   └── *.gd                   # Other scripts
│
├── Objects/                   # Reusable game objects
│   ├── Character/             # Player character scene
│   ├── Mosca/                 # Fly enemies (moving/static)
│   ├── Box/                   # Platforms
│   └── *.tscn                 # Object scenes
│
├── Levels/                   # Level scenes
│   ├── Level 1/               # Stage levels (1-4)
│   ├── Level 2/               # Boss level
│   ├── gameover.tscn           # Game over screen
│   └── win.tscn               # Victory screen
│
├── Global.gd                  # Autoload — global state
├── project.godot              # Godot project entry
└── Export/                    # HTML5 export output (local)
```

---

## 8. Code Conventions

### Scene Structure

```
res://Levels/Level 1/scene1.tscn    # Main entry point
```

### Naming Conventions

- **Scenes:** PascalCase (e.g., `Character.tscn`, `Boss.tscn`)
- **Scripts:** PascalCase (e.g., `PlayerMovement.gd`, `Boss.gd`)
- **Nodes:** snake_case (e.g., `Sprite`, `AnimationPlayer`)

### Global Variables

```gdscript
var health = 3           # Player lives
var moscas = 10          # Flies collected per level
```

---

## 9. Troubleshooting

### "Game doesn't start"

1. Verify Godot 3.x is installed
2. Open `project.godot` in Godot editor
3. Press F5 to run

### "Collision not working"

1. Check collision layers in scene
2. Verify Area2D shapes are configured
3. Check group names: `enemy`, `object`

### "Scene transitions not working"

1. Verify scene paths in `Global.gd`
2. Check scene files exist in `Levels/`

---

## 10. Changelog

### v0.1.0 Alfa (2026-04-26)
- ✅ Feat: Physics-based player movement
- ✅ Feat: Double-jump system
- ✅ Feat: Tongue attack (Area2D)
- ✅ Feat: Enemy types (flies, frogs, boss)
- ✅ Feat: Health & damage system
- ✅ Feat: Level progression
- ✅ Feat: Victory/Game Over screens

---

## 11. Roadmap

See [Docs/ROADMAP.md](Docs/ROADMAP.md) for detailed progress tracking.

---

## 12. Resources

- **Repository:** https://github.com/NicoRuedaA/Platform_Godot
- **Godot Docs:** https://docs.godotengine.org/en/stable/
- **Issues:** https://github.com/NicoRuedaA/Platform_Godot/issues

---

<i>Built with Godot Engine 3 + GDScript + passion</i>