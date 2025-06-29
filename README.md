# 🎮 Racing Snakes

*Eat the food. Outsmart your opponent. Claim eternal glory.*

---

## 🐍 About

**Racing Snakes** is a fast-paced, two-player twist on the classic Snake game, built with the [Ruby2D](https://www.ruby2d.com/) framework.

Inspired by [Mario Visic's tutorial](https://www.youtube.com/watch?v=2UVhYHBT_1o), this project introduces multiplayer gameplay, randomized aesthetics, and refined game rules for a fresh competitive experience.

---

## ⚙️ Setup and Installation

### Requirements

- **macOS** or **Linux**
- **Ruby 3.3+** (recommended: [rbenv](https://github.com/rbenv/rbenv))
- **RubyGems** & **Bundler**

### Environment Setup

```sh
# Install Ruby using rbenv
rbenv install 3.3.4
rbenv global 3.3.4

# Clone the repository
git clone https://github.com/yourusername/racing_snakes_gem.git
cd racing_snakes_gem

# Install dependencies
bundle install
```

### Using the Rakefile

You can use `rake` to build, install, and test the gem:

| Task           | Description                  |
|----------------|-----------------------------|
| `rake`         | Run all specs (default)      |
| `rake build`   | Build the `.gem` file        |
| `rake install` | Build and install locally    |
| `rake clean`   | Remove generated `.gem` files|

To install locally:
```sh
rake install
```

---

## 🕹️ How To Play

Once installed, start the game from your terminal:

```sh
racing_snakes
```

### Controls

- **Player 1:** `↑` = Up, `↓` = Down, `←` = Left, `→` = Right
- **Player 2:** `W` = Up, `S` = Down, `A` = Left, `D` = Right
- **Pause:** `Space`
- **Quit:** `Escape`

**Goal:** Eat food to grow. The first snake to crash loses. A head-on collision results in a draw.

---

## 🧪 Testing

Run the test suite with:

```sh
rake
# or
bundle exec rspec spec/
```

---

## ✨ Features & Enhancements

Compared to the original tutorial, this version adds:

- 🐍 **Two-player competitive mode**
- 🥗 **Food spawns only on empty tiles**
- ⏱️ **Food re-spawns after 15–20 seconds of inactivity**
- 🎨 **Randomized snake colors & graphical polish**
- ⏸️ **Pause function (space bar)**
- 🧠 **Clock-based turn logic: only one turn per tick**

---

Enjoy the game and may the best snake win!

