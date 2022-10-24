# Live Activity Background Update Demo
A demo about how to refresh Live Activity with the "sound" background mode.

## The Basics

While in the background, Live Activity can only be refreshed when you are using location. But there is a workaround!

1. Prepare a background task. (Or your app will be closed when the sound stopped.)
2. Stop the sound for 5 seconds before refreshing.
3. Refresh your activity.

It does not make any sense. But it works!

The only downside is, in every 30 seconds, there will be 5 seconds it won't refresh. Because the background task only lasts 30 seconds. It should last infinitely long. (Still testing. I'm not sure.)
