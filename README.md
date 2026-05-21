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

## Example

You ask Claude to add JWT auth. It writes 35 lines of middleware. Instead of silently moving on:

```
This middleware validates the Bearer token on every request before it reaches your 
route handlers. Valid token → passes through. The non-obvious part: expired tokens 
return 401 silently — there is no refresh attempt here. That is intentional (refresh 
is the client's job), but if you expect silent token renewal, requests will start 
failing without an obvious error message to trace.

Makes sense, or want me to dig into any part?
```

You now know your auth works. You know where it doesn't. You can debug it when something goes wrong.
