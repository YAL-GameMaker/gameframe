## gameframe

**Quick links:** [documentation](https://yal.cc/docs/gm/gameframe)
  · [itch.io](https://yellowafterlife.itch.io/gamemaker-gameframe)  
**Versions:** GameMaker Studio 2.3 (for now)  
**Platforms:** Windows, Windows (YYC)

This extension gives GameMaker games a custom window caption+border that act like a native one.
	
That includes the minimize/maximize buttons,
moving/resizing the window,
common (and less common) keyboard and mouse shortcuts,
and even the window shadow and rounded borders on Windows 11.
	
Having a custom border+caption subsequently allows for a few things:

- Toggling window border on demand
- Supporting exclusive fullscreen, borderless fullscreen, and windowed modes.  
    (which more and more players expect from you as time goes on)
- Not freezing the application while the user is dragging the window around.  
    (essential for competitive online games)
- Customizing the title bar and/or border.  
    (now that it's game code that's drawing them)

## What's interesting here

A lot of this extension is pretty normal code, really -
buttons, callbacks, variables for customization. Not complex, but there's a bunch of it.

Default icons and animations are stylized to look akin to Windows 10, which also took a little while. And apparently UI scale doesn't _just_ scale component sizes by X%? That's fun.

On other hand, a native window shadow on a borderless window turned out to be a surprisingly high-effort feature consisting of multiple poorly documented WinAPI tricks.

## Building 

See [BUILD.md](BUILD.md)

## Meta

**Author:** [YellowAfterlife](https://github.com/YellowAfterlife)  
**License:** Custom license (see `LICENSE`)