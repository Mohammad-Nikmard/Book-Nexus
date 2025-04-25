# Book Nexus

Book Nexus is a modern Flutter application designed to provide a seamless book reading and management experience. The application features a clean, material design interface with smooth animations and transitions.

## Features

- Modern and responsive UI with Material Design
- Smooth animations using flutter_staggered_animations
- Custom font integration with Noto Sans family
- SVG support for crisp vector graphics
- Cross-platform compatibility (iOS and Android)

## Tech Stack

- Flutter SDK (^3.5.0)
- Key Dependencies:
  - flutter_svg: ^2.0.16 (SVG rendering)
  - flutter_staggered_animations: ^1.1.1 (Animation effects)
  - animations: ^2.0.11 (Advanced animations)
  - flutter_gen: ^5.10.0 (Asset code generation)

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Book-Nexus.git
   cd Book-Nexus
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate assets code (using flutter_gen):
   ```bash
   flutter pub run build_runner build
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
  ├── gen/          # Generated asset code
  ├── ui/           # UI screens and widgets
  └── main.dart     # Application entry point

assets/
  ├── fonts/        # Custom Noto Sans fonts
  ├── images/       # Image assets
  └── svg/          # SVG assets
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
