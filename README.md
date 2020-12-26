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
   all.

2. The schema should preserve the developers intention. For example, imagine you
   had to write a program which given a piece of HTML, identified whether one
   element is a header for another. The task would likely be extremely
   challenging or impossible. If you had the same task but were given an app's
   schema, you should be able to pick out what needs to be headers for what.



Here are some possible benefits of using something like that to define a UI.

1. Apps created this way would be cross platform in a multitude of ways. A
renderer could run on Linux, Window, Mac, in a browser, as a TUI, as a CLI, on a
smartwatch, in a voice assistant, etc. All of those platforms come for free
(assuming someone wrote the renderer) without any extra work. Why have CLI in
the mix? CLI's are incredibly powerful but they lack user friendliness and
discoverability. Imagine if a more powerful version of tab completion existed
that could pull up a TUI for the command you wanted to run. You would then
highlight the data you want to extract or the actions you want to take and the
command would be automatically generated for you.

2. Apps can be trivially streamed. Let's say you're on call and are getting
reports of slow response times on a server. You can pull out your phone, launch
htop on the server, then stream the UI back to your phone. As another example
imagine you receive a notification on your smartwatch for a messaging app.
Initially, you think the notification is something small so you launch the app
on your smartwatch to read it. Turns out it's a long one so you click a button
and now your computer has opened the desktop app to the same chat you were
looking at on your watch. Since watches are underpowered, the backend might be
running on your phone, desktop, or the platform's servers. Basically, picture
X11 network transparency but for this century where services are run in the
cloud and everyone has multiple devices.

3. Apps will trivially support power users. Although most people would use
an app like Discord as a GUI, some might want to automate aspects of their
communication or pipe other programs to and from Discord. With a CLI renderer,
every app would have both a GUI and a CLI. Using the CLI, you could create
arbitrarily complex scripts and pipelines to accomplish whatever you want.

4. Users have the most control. Although some kind of unwritten css-like
protocol would exist for theming your app, the user would have the ability to
overwrite anything they want. Because the protocols try to preserve developer
intention, it should be somewhat difficult to overwrite the style and make the
interface unusable. This is also important since styles will mostly be ignored
in a TUI or CLI environment.

5. Developers will be naturally guided towards accessible interfaces. If I can
render an app as either a CLI or a mobile app, how much harder would it be to
render it for a screen reader or other assistive technology?

6. Developers can reuse a lot of existing work. The format used to describe your
UI should look fairly close to how you might choose to store your program state
internally. Ideally, the best way to represent your data on the backend would
also create the best UI for your app although that's a little more out there.
Since you don't need to juggle data between the backend and the frontend, you
can save a lot of time.


The biggest downside is that developers have a LOT less control over how their
app looks. The "thesis" presented in these experiments is that developers
shouldn't want precise control over app layout. They can accomplish everything
they set out to do, still have branding and a unique style, but gain all of the
features mentioned above by letting a program actually lay everything onto the
screen.

To "prove" this thesis, these experiments try to imagine a language/protocol
that existing apps could use to recreate their UI. These recreations will not be
exact. To simplify the language, the UI might be changed in subtle or unsubtle
ways. Any changes will have to be justified as no worse than the real version.

There are currently two experiments. The htop one is the most complete. The
Discord one hasn't been updated in a while. Although some of the syntax might
look like the htop version, its semantics are almost completely different.

As a quick disclaimer, I'm not fully convinced that the schema/protocol I'm
looking for actually exists. The experiments have a long way to go but I hope
they'll make it easier to answer the question posed at the beginning of this
document.


## Possible Name

Although the project barely exists, there is a name that might capture its
goals/spirit. That name is the "Free UI". The word free here is used in a few
connotations. First, it's meant to imply the spirit of open source software and
how it gives end users control over what happens on their computer. For
developers, it captures the idea of a mathematically free structure. Math majors
will probably hate this description, but a free structure of some type is one
which only knows the bare minimum about itself to achieve the requirements that
structures of that type must adhere to. That property also means that you can
convert the free structure into any other structure of that type. This project
could be thought of as the free UI structure with all other devices or platforms
being ones you can trivially convert to. It's also like when developers say you
can get a feature for free when using a library when you were initially only
trying to get a different feature.

## Organization

The htop.txt file is pretty up to date as is this one. The rest are either out
of date, incomplete, wrong, or dead ends.
