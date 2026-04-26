# Platform Godot — Roadmap

> **Last Updated:** 26-APR-2026

---

## Overview

| Phase | Name | Status | Progress |
|-------|------|--------|----------|
| 1 | Core Gameplay | ✅ DONE | 100% |
| 2 | Combat System | ✅ DONE | 100% |
| 3 | Level Design | ✅ DONE | 100% |
| 4 | Enemy Variety | ✅ DONE | 100% |
| 5 | Visual Polish | ⚠️ IN PROGRESS | 20% |
| 6 | Audio | ⚠️ IN PROGRESS | 0% |
| 7 | UI Polish | 📋 BACKLOG | 0% |
| 8 | Save System | 📋 BACKLOG | 0% |
| 9 | Polish & Release | 📋 BACKLOG | 0% |

---

## Phase 1: Core Gameplay ✅ DONE (100%)

- [x] KinematicBody2D player physics
- [x] Horizontal movement (WASD / Arrows)
- [x] Jump with variable height
- [x] Double-jump system
- [x] Run (Shift key)
- [x] Gravity and fall mechanics

**Files:**
- `Scripts/Character.gd` — Base character physics
- `Scripts/playerMovement.gd` — Player movement implementation

---

## Phase 2: Combat System ✅ DONE (100%)

- [x] Tongue attack (Area2D)
- [x] Attack animations
- [x] Damage system
- [x] Invulnerability frames
- [x] Knockback on damage
- [x] Damage flash visual feedback

**Files:**
- `Scripts/playerMovement.gd` — Lines 118-146 (tongue attack)
- `Scripts/playerMovement.gd` — Lines 157-194 (damage system)

---

## Phase 3: Level Design ✅ DONE (100%)

- [x] Level 1 (Stage 1)
- [x] Level 2 (Stage 2)
- [x] Level 3 (Stage 3)
- [x] Level 4 (Stage 4)
- [x] Level 5 (Boss)
- [x] Game Over screen
- [x] Victory screen

**Files:**
- `Levels/Level 1/scene1.tscn` — Stage 1
- `Levels/Level 1/scene2.tscn` — Stage 2
- `Levels/Level 1/scene3.tscn` — Stage 3
- `Levels/Level 1/scene4.tscn` — Stage 4
- `Levels/Level 2/level 2.tscn` — Boss level

---

## Phase 4: Enemy Variety ✅ DONE (100%)

- [x] Fly (moving)
- [x] Fly (static)
- [x] Frog (Sapo)
- [x] Boss encounter

**Files:**
- `Objects/Mosca/MoscaMovimiento/`
- `Objects/Mosca/MoscaEstatica/`
- `Objects/Sapo/`
- `Scripts/Boss.gd`

---

## Phase 5: Visual Polish ⚠️ IN PROGRESS (20%)

- [x] Parallax scrolling background
- [x] AnimationPlayer states
- [ ] Particle effects
- [ ] Screen shake on damage
- [ ] Smooth camera transitions
- [ ] Better enemy death animations
- [ ] Title screen

**Files:**
- `Scripts/grua.gd` — Parallax

---

## Phase 6: Audio ⚠️ IN PROGRESS (0%)

- [ ] Background music
- [ ] Jump sound effect
- [ ] Attack sound effect
- [ ] Enemy hit sound
- [ ] Collectible sound (fly)
- [ ] Damage taken sound
- [ ] Boss music

**Files:**
- Needs: `assets/audio/`

---

## Phase 7: UI Polish 📋 BACKLOG (0%)

- [ ] Pause menu
- [ ] Main menu
- [ ] Settings menu
- [ ] Controls display
- [ ] Level select

---

## Phase 8: Save System 📋 BACKLOG (0%)

- [ ] Save/Load player progress
- [ ] High score tracking
- [ ] Unlockable levels
- [ ] Settings persistence

---

## Phase 9: Polish & Release 📋 BACKLOG (0%)

- [ ] Bug fixes
- [ ] Performance optimization
- [ ] Mobile controls
- [ ] Export to HTML5
- [ ] Export to Desktop
- [ ] Release v1.0.0

---

## Progress Summary

```
Phase 1 (Core):      ████████████████████ 100%
Phase 2 (Combat):    ████████████████████ 100%
Phase 3 (Levels):    ████████████████████ 100%
Phase 4 (Enemies):  ████████████████████ 100%
Phase 5 (Visuals):   ████░░░░░░░░░░░░░░░░░ 20%
Phase 6 (Audio):    ░░░░░░░░░░░░░░░░░░░░░  0%
Phase 7 (UI):       ░░░░░░░░░░░░░░░░░░░░░  0%
Phase 8 (Save):     ░░░░░░░░░░░░░░░░░░░░░  0%
Phase 9 (Release):  ░░░░░░░░░░░░░░░░░░░░░  0%
```

---

## Links

- **Repository:** https://github.com/NicoRuedaA/Platform_Godot
- **Issues:** https://github.com/NicoRuedaA/Platform_Godot/issues