## UIAspectRatioConstraint
- Setting the Aspect Ratio of the parent frame will ensure that all of its children will scale relative to it across all screen sizes (since the view that we see in Studio will persist across different sizes).
  - Still unsure if the same case can be said for other descendants though

## Grid Layout and Scrolling Frame

Some important things to check when wanting to scale UI elements inside a ScrollingFrame with a UIGridLayout constraint:
- Set `CellSize` in `UIGridLayout` properties to scale. Allows the cells in the grid to scale up/down when screen size changes.
- Set `AutomaticCanvasSize` to `XY`. Ensures that canvas size `Scale` property adjusts based on the cells size. 
  - _Tried manually manipulating the `Scale` property of `CanvasSize` to achieve the same result, didn't work as well but unsure why._
  - > Though when the **canvas size gets bigger** if something is **scaled** it will become **longer**. This is due to the **AbsoluteSize of the scrolling frame getting bigger** when the **canvas size gets bigger**. This can be ignored by using offset which is in pixels, or you can use a script that will resize the CellSize when the scrolling frame’s AbsoluteSize changes.
- In a `LocalScript`, adjust the X and Y offset of your `CanvasSize` if you have any offsets in your `CellSize` or have any paddings.

## General Remarks
- When exporting frames from Figma/Photoshop, **best to use an `ImageLabel` and set it as the parent**. It's more difficult to manage when you try to group everything with an actual `Frame` holder due to scaling with relative constraints.

<p align="center">
  <img src="https://user-images.githubusercontent.com/59037332/179273971-6a192825-40cd-4331-b119-2e3ea896b81b.png">
</p>

## References
- [AutoScale Canvas Size for UIGridLayout (source of quote)](https://devforum.roblox.com/t/how-do-i-auto-scale-canvas-size-for-a-uigridlayout/1465332)
- [UI Design Objects](https://devforum.roblox.com/t/ui-design-objects-tips/613948)
