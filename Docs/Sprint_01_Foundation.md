# MMA Dynasty Dev Log
## Sprint 1 — Foundation / UI Framework

**Date:** June 30 – July 5, 2026  
**Version Target:** v0.0.1  
**Status:** Complete

---

## Sprint Objective

Create the production foundation for MMA Dynasty in Godot.

The goal of Sprint 1 was not gameplay. The goal was to establish the project structure, reusable UI workflow, GitHub version control, and the first playable-looking dashboard prototype.

---

## Completed

### Project Setup
- Created new Godot production project.
- Set project direction around desktop-first development with mobile-first landscape UI.
- Established folder structure for scenes, scripts, assets, data, themes, and documentation.
- Connected the project to GitHub.
- Created first working Git workflow.

### UI Foundation
Built the first reusable UI components:

- `UIPanel.tscn`
- `TopBar.tscn`
- `BottomNavigation.tscn`
- `StatCard.tscn`
- `FighterCard.tscn`
- `FighterMiniCard.tscn`
- `NewsCard.tscn`
- `NewsListItem.tscn`

### Dashboard
Created the first production dashboard prototype with:

- Camp overview
- Featured fighters
- Upcoming schedule
- Recent news
- Rankings snapshot
- Financial snapshot
- Top information bar
- Bottom navigation

### Styling
Applied the first visual pass:

- Dark background
- Dark panel fills
- Consistent borders
- Compact dashboard cards
- Basic text hierarchy
- Cleaner bottom navigation

---

## Major Decisions

### UI Architecture

Changed from using one fixed layout for every screen to a modular component system.

Final direction:

- Every screen can have a custom layout.
- Every screen uses the same UI language.
- Reusable components create consistency.
- Dashboard components differ from full-screen components.

### Dashboard Components

Discovered that full-size components do not always work inside dashboard panels.

Created smaller dashboard-specific components:

- `FighterMiniCard`
- `NewsListItem`

This avoids overcrowding small panels.

### Development Strategy

Confirmed the long-term approach:

- Build desktop first.
- Keep landscape mobile readability in mind.
- Launch Steam Early Access before mobile 1.0.
- Port to mobile after the desktop version stabilizes.

---

## What Worked

- GitHub repository is functioning.
- Reusable scene workflow is working.
- Dashboard can be assembled from components.
- Containers are beginning to make sense.
- MarginContainer behavior is clearer.
- The project now has a repeatable development process.

---

## Problems Encountered

### Godot Layout Confusion
Containers, size flags, margins, and offsets caused repeated layout issues.

Important lesson:

- Offset values can use negatives.
- MarginContainer constants should usually be positive.
- Containers control child layout.
- Children need proper size flags.
- Small UI needs compact text.

### Overbuilt Components
`FighterCard` and `NewsCard` were too large for dashboard use.

Solution:

- Keep them for larger screens.
- Use `FighterMiniCard` and `NewsListItem` for dashboard summaries.

---

## Current Build State

The project currently has:

- A working Godot project
- GitHub backup
- Reusable UI component library
- Dashboard prototype
- First styling pass
- Dev log workflow

This is not yet gameplay, but the production foundation exists.

---

## Sprint 1 Result

Sprint 1 successfully established the foundation for MMA Dynasty.

The project is now ready to move from UI framework development into actual game data.

---

## Next Sprint

## Sprint 2 — Fighter Data Foundation

Primary goal:

Create real fighter data and connect it to UI.

Planned work:

- WFC Lightweight pilot division document
- FighterData resource
- First curated fighter data files
- PromotionData
- WeightClassData
- Connect FighterData to FighterCard
- Display real fighter data on Dashboard

---

## Notes

The main takeaway from Sprint 1 is that MMA Dynasty should be built as a modular management game framework.

The UI will grow through reusable components rather than one-off screens. This should make future development faster and keep the game visually consistent as the project grows toward a playable prototype.
