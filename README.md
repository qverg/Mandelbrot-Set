# Mandelbrot-Set
Rendering of the Mandelbrot Set using Processing. Most of the rendering is done in the fragment shader I wrote (with the algorithm from Wikipedia). The colours I used are from the Bob Ross colour palette.

To run this, you will have to download the entire MandelbrotSet folder. Open the pde file in Processing. I recommend putting Processing in shader mode for shader highlighting. You can use the mouse to zoom in and move around. 'i' and 'o' also zoom in and out respectively.

If you want to get your own palette from some text file containing RGB values (like the source code from this website https://flaviocopes.com/rgb-color-codes/), you can use the Python script which will generate the right code to paste into the glsl file. If you do this, look for the similar arrays inside the shader and give your own array its own name. To use it as a palette, set the 'colors' array to be your array.

Useful links:
https://en.wikipedia.org/wiki/Mandelbrot_set
https://en.wikipedia.org/wiki/Plotting_algorithms_for_the_Mandelbrot_set
https://www.rapidtables.com/web/color/index.html
