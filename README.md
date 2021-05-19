# UI Experiments

Take a look at any of the thousand messaging platforms. If you squint, you might
notice that they all look extremely similar. Get rid of the branding and maybe
pull off a few features and you have the same UI across all of them. Is it a
coincidence that all of these apps converged on the same way of representing
messages, or is it a property of the data they're trying to make interactive?

This repo explores whether it's possible to automatically generate app layouts
using a fairly generic description of an application's state.


What does it mean for a description/schema to be fairly generic?

1. The schema should look like something you would create in a backend with very
   little of the layout/style poking through. Style/branding should be completely
   separate from the data (kind of like CSS) and layout shouldn't be specified at
   all. It should be impossible to break apps when changing the style/branding.

2. The schema should preserve the developers intention. For example, imagine you
   had to write a program which, given a piece of HTML, identified whether one
   div is a headerbar for another div. The schema should make queries like this
   one extremely easy to implement.



Here are some possible benefits of using something like this to define a UI.

1. Apps created this way would be cross platform in a multitude of ways. A
   renderer could run on Linux, Window, Mac, in a browser, as a TUI, as a CLI, on a
   smartwatch, in a voice assistant, etc. All of those platforms come for free
   (assuming someone wrote the renderer) without any extra work.

   Why have CLI in the mix? CLI's are incredibly powerful but they lack user friendliness and
   discoverability. Imagine if a more powerful version of tab completion existed
   that could pull up a TUI for the command you wanted to run. You would then
   highlight the data you want to extract or the actions you want to take and the
   command would be automatically generated for you. If you perform the action
   often, you'd probably memorize the command naturally.

2. Apps can be trivially streamed. Let's say you're on call at a company and are
   getting reports of slow response times on a server. You can pull out your
   phone, launch htop on the server, then stream the UI back to your phone. As
   another example, imagine you receive a notification on your smartwatch for a
   messaging app.  Initially, you think the notification is something small so
   you launch the app on your smartwatch to read it. Turns out it's a long one
   so you click a button and now your computer has opened the desktop app to the
   same chat you were looking at on your watch. Since watches are underpowered,
   the backend might be running on your phone, desktop, or the platform's
   servers. Basically, picture X11 network transparency but for this century.
   Services can be run in the cloud and everyone can use multiple smart devices.

3. Apps will trivially support power users. Although most people would use
   an app like Discord as a GUI, some might want to automate aspects of their
   communication or pipe other programs to and from Discord. With a CLI renderer,
   every app would have both a GUI and a CLI. Using the CLI, you could create
   arbitrarily complex scripts and pipelines to accomplish whatever you want.

4. Users have the most control. Although some kind of (unwritten) css-like
   protocol would exist for theming your app, the user would have the ability to
   override anything they want. Apps can still provide defaults for users that
   don't want to change anything.

5. Developers will be naturally guided towards accessible interfaces. If I can
   render an app as either a CLI or a mobile app, how much harder would it be to
   render it for a screen reader or other assistive technology?

6. Developers can reuse a lot of existing work. The format used to describe your
   UI should look fairly close to how you might choose to store your program
   state internally. Ideally, the best way to represent your data on the backend
   would also create the best UI for your app. Since you don't need to juggle
   data between the backend and the frontend, you can save a lot of time.


The biggest downside is that developers have a LOT less control over how their
app looks. The main idea presented in these experiments is that developers
shouldn't want precise control over app layouts. They can accomplish everything
they set out to do, still have branding and a unique style, and gain all of the
features mentioned above by letting another program actually lay everything onto
the screen.

To "prove" this idea, these experiments try to imagine a language/protocol that
existing apps could use to recreate their UI. These recreations will not be
exact. To simplify the language, the UI might be changed in subtle or unsubtle
ways. Any changes will have to be justified as no worse than the real version.

As a quick disclaimer, I'm not fully convinced that the schema/protocol I'm
looking for actually exists. The experiments have a long way to go but I hope
they'll make it easier to answer the question posed at the beginning of this
document.

## Organization

Someone reading this should probably start with htop.myui since it has the most
comments. From there, both discord.myui and cp.myui move in opposite directions.
One tries to represent a graphically rich application and the other tries to
represent a CLI.
