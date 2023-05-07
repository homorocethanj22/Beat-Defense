Welcome to Beat Defense, a music-infused tower defense game where enemies follow the rhythm of a song's beat.


Install & Play:

1. Download source code in the form of a .zip file from the gitlab repository.

        https://gitlab.cs.vt.edu/rossgshaffer/beat-defense

2. Extract beat-defense.zip file in an accessible place.

3. Download Godot Engine specifically version 3.5.2, then extract that folder in
   an accessible place as well.

        https://godotengine.org/download/3.x/windows/

   *Do NOT choose the C# support download*

4. Open the Godot Engine after extracting and select the import button on the right
   side of the window.

5. Click browse, then navigate to, then open your extracted beat-defense folder.

6. Select the project.godot file, then click open.

7. Now click Import & Edit

8. To play the game, click the play button in the top right corner of the Godot Engine window

9. Enjoy!


Controls

F key = Play Drums
D key = Play Guitar

J key = Play Keyboard
K key = Play Cymbals


Credits

In this project, we used an addon called BeatKeeper. It is a Godot plugin which we used to
keep in beat with the background music. It can achieve this by sending signals on beat invervals
of varying time invertals based on the BPM of the song being played. Such intervals include whole
beats, half beats, third beats, quarter beats, fifth beats, sixth beats, seventh beats, eighth beats,
ninth beats, twelfth beats, and sixteenth beats. More information can be found at the link below.

https://github.com/ynot01/Godot-BeatKeeper
