<?php

declare(strict_types=1);

namespace Oc\Security;

use Doctrine\DBAL\Exception;
use Oc\Entity\UserEntity;
use Oc\Repository\Exception\RecordNotFoundException;
use Oc\Repository\UserRepository;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UserNotFoundException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;

class UserProvider implements UserProviderInterface
{
    private UserRepository $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * @throws Exception
     */
    public function loadUserByIdentifier($identifier): UserInterface
    {
        try {
            return $this->userRepository->fetchOneByUsername($identifier);
        } catch (RecordNotFoundException $e) {
            throw new UserNotFoundException('User by username "' . $identifier . '" not found!', 0, $e);
        }
    }

    /**
     * @throws Exception
     */
    public function loadUserByUsername($username): UserInterface {
        return $this->loadUserByIdentifier($username);
    }

    /**
     * @throws Exception
     * @throws RecordNotFoundException
     */
    public function refreshUser(UserInterface $user): UserInterface
    {
        if (!$user instanceof UserEntity) {
            throw new UnsupportedUserException(sprintf('Invalid user class "%s".', get_class($user)));
        }

        return $this->userRepository->fetchOneByUsername($user->getUserIdentifier());
    }

    /**
     * @param $class
     *
     * @return bool
     */
    public function supportsClass($class): bool
    {
        return UserEntity::class === $class || is_subclass_of($class, UserEntity::class);
    }
}
