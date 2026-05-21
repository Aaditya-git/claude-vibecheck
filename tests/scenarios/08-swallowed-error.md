# Scenario 08: Error Swallowed in Catch Block

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Wrap the payment processing call in a try/catch"

## What Claude writes

```
try {
  await processPayment(order);
} catch (err) {
  console.log('Payment failed');
}
```

## Expected vibecheck narration

Should cover:
1. What it does: catches any error from processPayment and logs a message
2. Non-obvious: the error is swallowed — execution continues after the catch as if nothing happened, and the caller has no way to know the payment failed
3. Why it matters: orders will silently complete in your system without payment going through; always rethrow or return a failure signal unless you have a deliberate reason to absorb the error

## Pass criteria

vibecheck fires. Narration specifically calls out that execution continues silently after the failed payment.
