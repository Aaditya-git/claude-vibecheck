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

## Install

```bash
git clone https://github.com/your-username/claude-vibecheck
cd claude-vibecheck

# Symlink (recommended — picks up updates automatically)
ln -s "$(pwd)/skill" ~/.claude/skills/vibecheck
```

Restart Claude Code. That's it.

See [INSTALL.md](INSTALL.md) for full instructions and uninstall steps.

## FAQ

**Won't this be annoying?**
Only if you're okay not understanding the code you ship. vibecheck only fires on genuinely non-obvious code — trivial changes pass through silently. And you can always type `skip`.

**Why not just ask Claude to explain in chat?**
You have to remember to ask. And the people who most need this explanation are the ones who never ask. vibecheck fires whether or not you thought to request it.

**Does this slow down my workflow?**
Reading 4 sentences takes 15 seconds. Debugging code you didn't understand takes hours.

**What counts as non-obvious?**
Auth flows, async race conditions, middleware chains, silent failure modes, state mutations with side effects, database transactions. Not renames, not formatting, not console.log.
