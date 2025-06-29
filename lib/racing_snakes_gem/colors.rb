# frozen_string_literal: true

# This module defines a set of color constants that can be used throughout the application.
# Each color is represented as a string.
# The constants are defined using the `||=` operator to ensure they are only set once.
module Colors
  YELLOW ||= 'yellow'
  ORANGE ||= 'orange'
  RED ||= 'red'
  FUCHSIA ||= 'fuchsia'
  BLUE ||= 'blue'
  GREEN ||= 'green'
end
