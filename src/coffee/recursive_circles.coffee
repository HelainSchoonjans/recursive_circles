"use strict"
class RecursiveCirclesFractal
  numberOfRows: 400
  numberOfColumns: 600
  canvas: null
  drawingContext: null
  maxIterations: 25
  cellSize: 1  # size of a pixel
  resolution: 150    # number of pixel per unit
  center_r: 0
  center_i: 0

  constructor: ->
    @createCanvas()
    @resizeCanvas()
    @createDrawingContext()
    @drawFractal()
  
  drawFractal: ->
    console.log "Begin generation with", @maxIterations, "iteration(s)"
    console.log "Centered at", @center_r, @center_i
    @draw(@numberOfColumns/2 + @center_r,@numberOfRows/2 + @center_i, @resolution, 0)
    console.log "Finished"

  createCanvas: ->
    @canvas = document.createElement 'canvas'
    document.body.appendChild @canvas

  resizeCanvas: ->
    @canvas.height = @cellSize * @numberOfRows
    @canvas.width = @cellSize * @numberOfColumns

  createDrawingContext: ->
    @drawingContext = @canvas.getContext '2d'

  draw: (x, y, radius, iteration) ->
    @drawingContext.strokeStyle = "hsl(#{radius}, 60%, 50%)"
    @drawingContext.beginPath()
    @drawingContext.arc(x,y,radius,0,2*Math.PI)
    @drawingContext.stroke()
    if iteration < @maxIterations and radius > 1
      @draw(x, y, radius/2, iteration+1)

window.RecursiveCirclesFractal = RecursiveCirclesFractal