import math
import time

def get_primes_and_mask(limit):
    sieve = bytearray(b'\x01') * (limit + 1)
    sieve[0:2] = b'\x00\x00'
    for i in range(2, math.isqrt(limit) + 1):
        if sieve[i]:
            sieve[i * i : limit + 1 : i] = b'\x00' * ((limit - i * i) // i + 1)
    primes = [i for i in range(5, limit + 1) if sieve[i]]
    return primes, sieve

def factor_omega_min_prime(n, min_p):
    """Returns (omega(n), phi(n), sigma(n)) if every prime factor of n exceeds min_p; else None."""
    temp = n
    omega = 0
    phi = n
    sigma = 1
    d = 2
    while d * d <= temp:
        if temp % d == 0:
            if d <= min_p:
                return None
            omega += 1
            phi = (phi // d) * (d - 1)
            pk = 1
            s_term = 1
            while temp % d == 0:
                temp //= d
                pk *= d
                s_term += pk
            sigma *= s_term
        d += 1 if d == 2 else 2
    if temp > 1:
        if temp <= min_p:
            return None
        omega += 1
        phi = (phi // temp) * (temp - 1)
        sigma *= (1 + temp)
    return omega, phi, sigma

def main():
    t0 = time.time()
    Q_BOUND = 1_000_000
    primes, prime_mask = get_primes_and_mask(Q_BOUND)
    primes_p = [p for p in primes if p <= math.isqrt(Q_BOUND)]

    total_n_gt_p4 = 0
    survived_sieve = 0
    survived_min_p = 0
    omega_ge_4_count = 0
    hits = []

    for p in primes_p:
        p2 = p * p
        phi_p2 = p * (p - 1)
        sig_p2 = p2 + p + 1
        q_min = p2 + 1
        if q_min > Q_BOUND:
            break

        cand = bytearray(prime_mask[q_min : Q_BOUND + 1])
        total_n_gt_p4 += cand.count(1)

        for r in primes:
            if r > p:
                break
            if r == p:
                continue
            bad_q = (-12 * pow(p2, -1, r)) % r
            first_idx = (bad_q - q_min) % r
            cand[first_idx :: r] = b'\x00' * ((len(cand) - 1 - first_idx) // r + 1)

        surviving_qs = [q_min + idx for idx, flag in enumerate(cand) if flag]
        survived_sieve += len(surviving_qs)

        for q in surviving_qs:
            N = p2 * q + 12
            res = factor_omega_min_prime(N, p)
            if res is None:
                continue
            survived_min_p += 1
            omega, phi_N, sig_N = res
            if omega >= 4:
                omega_ge_4_count += 1
                if phi_N == phi_p2 * (q - 1) + 12 and sig_N == sig_p2 * (q + 1) + 12:
                    hits.append((p, q, N))

    elapsed = time.time() - t0
    print(f"Elapsed: {elapsed:.2f}s")
    print(f"Admissible primes 5 <= p <= {primes_p[-1]} ({len(primes_p)} primes), p^2 < q <= {Q_BOUND}")
    print(f"Raw pairs with N > p^4: {total_n_gt_p4}")
    print(f"Survived r <= p modular pre-sieve: {survived_sieve}")
    print(f"All prime factors > p: {survived_min_p}")
    print(f"Candidates with omega(N) >= 4: {omega_ge_4_count}")
    print(f"Simultaneous jump hits: {len(hits)}")

if __name__ == "__main__":
    main()
