import 'package:solar/models/planet.dart';

final List<Planet> planetsData = [
  Planet(
    name: 'Sun',
    description:
        " The Sun is a yellow dwarf star, a hot ball of glowing gases at the heart of our solar system. Its gravity holds everything from the biggest planets to tiny debris in its orbit.",
    image: 'assets/images/sun.png',
    type: 'Yellow Dwarf Planet',
    distanceFromSun: '0',
    totalNoOfMoons: '0',
    yearLength: 'unknown',
  ),
  Planet(
    name: 'Mercury',
    description:
        "Mercury—the smallest planet in our solar system and closest to the Sun—is only slightly larger than Earth's Moon. Mercury is the fastest planet, zipping around the Sun every 88 Earth days",
    image: 'assets/images/mercury.png',
    type: 'Terrestrial',
    distanceFromSun: '0.4',
    totalNoOfMoons: '0',
    yearLength: '88',
  ),
  Planet(
    name: 'Venus',
    description:
        "Venus spins slowly in the opposite direction from most planets. A thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system",
    image: 'assets/images/venus.png',
    type: 'Terrestrial',
    distanceFromSun: '0.7',
    totalNoOfMoons: '0',
    yearLength: '255',
  ),
  Planet(
    name: 'Earth',
    description:
        "Earth—our home planet—is the only place we know of so far that’s inhabited by living things. It's also the only planet in our solar system with liquid water on the surface",
    image: 'assets/images/earth.png',
    type: 'Terrestrial',
    distanceFromSun: '1',
    totalNoOfMoons: '1',
    yearLength: '365.25',
  ),
  Planet(
    name: 'Mars',
    description:
        "Mars is a dusty, cold, desert world with a very thin atmosphere. There is strong evidence Mars was—billions of years ago—wetter and warmer, with a thicker atmosphere.",
    image: 'assets/images/mars.png',
    type: 'Terrestrial',
    distanceFromSun: '1.5',
    totalNoOfMoons: '2',
    yearLength: '687',
  ),
  Planet(
    name: 'Asteroid Belt',
    description:
        "The Asteroid belt consists majorly of Psyche asteroid and ceres dwarf planet.Psyche asteroid mostly metallic iron and nickel similar to Earth’s core.",
    image: 'assets/images/belt.png',
    type: 'Asteroid',
    distanceFromSun: '2.5-3.3',
    totalNoOfMoons: '0',
    yearLength: 'unknown',
  ),
  Planet(
    name: 'Jupiter',
    description:
        "Jupiter is more than twice as massive than the other planets of our solar system combined. The giant planet's Great Red spot is a centuries-old storm bigger than Earth.",
    image: 'assets/images/jupiter.png',
    type: 'Gas Giant',
    distanceFromSun: '5.2',
    totalNoOfMoons: '79',
    yearLength: '4,333',
  ),
  Planet(
    name: 'Saturn',
    description:
        "Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system. The other giant planets have rings, but none are as spectacular as Saturn's.",
    image: 'assets/images/saturn.png',
    type: 'Gas Giant',
    distanceFromSun: '9.5',
    totalNoOfMoons: '62',
    yearLength: '10,759',
  ),
  Planet(
    name: 'Uranus',
    description:
        "Uranus—seventh planet from the Sun—rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side.",
    image: 'assets/images/uranus.png',
    type: 'Ice Giant',
    distanceFromSun: '19.8',
    totalNoOfMoons: '27',
    yearLength: '30,687',
  ),
  Planet(
    name: 'Neptune',
    description:
        "Neptune—the eighth and most distant major planet orbiting our Sun—is dark, cold and whipped by supersonic winds. It was the first planet located through mathematical calculations, rather than by telescope.",
    image: 'assets/images/neptune.png',
    type: 'Ice Giant',
    distanceFromSun: '30.1',
    totalNoOfMoons: '14',
    yearLength: '60,190',
  ),
  Planet(
    name: 'Pluto',
    description:
        "Pluto is a complex world of ice mountains and frozen plains. Once considered the ninth planet, Pluto is the largest member of the Kuiper Belt and the best known of a new class of worlds called dwarf planets.",
    image: 'assets/images/pluto.png',
    type: 'Dwarf Planet',
    distanceFromSun: '39',
    totalNoOfMoons: '5',
    yearLength: '90,530',
  ),
];
