<?php

declare(strict_types=1);

namespace Oc\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\Table;
use Oc\Repository\AbstractEntity;
use Symfony\Component\Security\Core\User\EquatableInterface;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Entity
 * @Table(name="user")
 */
class UserEntity extends AbstractEntity implements UserInterface, PasswordAuthenticatedUserInterface, EquatableInterface
{
    /**
     * @Id
     * @ORM\Column(type="integer")
     * @GeneratedValue(strategy="AUTO")
     */
    public int $userId = 0;

    public string $dateCreated = '';

    public string $lastModified = '';

    public string $lastLogin = '';

    public string $username = '';

    public string $password = '';

    public string $email = '';

    public bool $emailProblems = false;

    public float $latitude = 0;

    public float $longitude = 0;

    public bool $isActive = false;

    public string $firstname = '';

    public string $lastname = '';

    public string $country = '';

    public bool $permanentLoginFlag = true;

    public string $activationCode = '';

    public string $language = 'DE';

    public string $description = '';

    public bool $gdprDeletion = false;

    public array $roles = ['ROLE_USER'];

    private string $salt = '';

    public function isNew(): bool
    {
        return $this->userId === 0;
    }

    public function getRoles(): array
    {
        $roles = $this->roles;
        $roles[] = 'ROLE_USER';
        return array_unique($roles);
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function getSalt(): ?string
    {
//        return $this->salt;
        return null;
    }

    public function getUsername(): string
    {
        return $this->username;
    }

    public function getUserIdentifier(): string
    {
        return $this->getUsername();
    }

    public function eraseCredentials(): void
    {
    }

    // TODO: Funktion wieder rauswerfen?
    public function isEqualTo(UserInterface $user): bool
    {
        if ($this->password !== $user->getPassword()) {
            return false;
        }

        if ($this->salt !== $user->getSalt()) {
            return false;
        }

        if ($this->username !== $user->getUsername()) {
            return false;
        }

        return true;
    }
}
