# vibecheck

> Stop shipping code you don't understand.

You've seen it. Someone opens Claude Code, asks it to build something, scrolls Twitter while it writes 80 lines, and hits enter. Three weeks later there's a bug nobody can debug because nobody on the team actually understood what was written.

**vibecheck** is a Claude Code skill that automatically narrates non-obvious code in plain English — at the moment it's written, before you move on.

## How it works

After every implementation block Claude writes, vibecheck silently evaluates:

> "Is there something here that a competent developer might not immediately understand?"

If **yes** → vibecheck narrates it in plain English: what it does, what's non-obvious, and what breaks if you don't understand it.

If **no** → complete silence. Trivial changes pass through without interruption.

You can always type `skip` or `got it` to move on. Skipping is a conscious choice — fundamentally different from passively clicking yes without reading.
