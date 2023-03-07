<?php

declare(strict_types=1);

namespace Oc\Security;

use Symfony\Component\PasswordHasher\PasswordHasherInterface;

class LegacyHasher implements PasswordHasherInterface
{
    public function hash(string $plainPassword): string
    {
        // Check if the MD5 hash algorithm is supported
        if (!in_array('md5', hash_algos(), true)) {
            throw new \Exception('MD5 is not supported by this system.');
        }

        dd($plainPassword);
        die();
        // Hash the password using the MD5 algorithm
        return md5($plainPassword);
    }

    public function verify(string $hashedPassword, string $plainPassword): bool
    {
        // Compare the hashed password with the MD5 hashed plaintext password
        return $hashedPassword === md5($plainPassword);
    }

    public function needsRehash(string $hashedPassword): bool
    {
        // There is no need to rehash with MD5, as it is considered insecure
        return false;
    }
}