# flutter_responsive_grid

Implementation of bootstrap concepts, like grid and spacing into the flutter world.
The goal is to provide an easy and familiar way of implementing responsive widgets, that can relay both in col sizes but 
also gracefully adapt to different screens.

It was done taking in consideration many of the already existant packages for the effect, but also developers knowledge 
of bootstrap.

## Getting Started

First add this dependency to your pubspec.yml

```yaml
dependencies:
 flutter_responsive_grid: ">=0.0.1 <1.0.0"
```

### Documentation

In this section the exposed **Widgets** of this package are explained by topic

- Rows and columns

**FlutterResponsiveRow** is the widget that will be rendered as Column.
**FlutterResponsiveCol** is the widget that holds the actual size and also the widget to be showed. 
A FlutterResponsiveCol should be inside FlutterResponsiveRow
  
- Display 

**Display** widget allows to hide or show content based on the viewport size

- Spacing Utils