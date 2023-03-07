<?php

declare(strict_types=1);

//use Oc\Security\LoginFormAuthenticator;
//use Oc\Security\UserProvider;
use Oc\Entity\UserEntity;
use Oc\Security\LegacyHasher;
use Symfony\Component\DependencyInjection\Loader\Configurator\ContainerConfigurator;
use Symfony\Config\SecurityConfig;

return static function (ContainerConfigurator $containerConfigurator, SecurityConfig $security): void {
    $security->passwordHasher(UserEntity::class)
            ->id(LegacyHasher::class)
            ->algorithm(LegacyHasher::class);

    $containerConfigurator->extension('security', [
            'providers' => [
                    'app_user_provider' => [
                            'entity' => [
                                'class' => 'Oc\Entity\UserEntity',
//                                    'class' => 'Oc\Security\UserProvider',
//                                'property' => 'username'
                            ]
                    ],
//            'users' => [
//                'id' => UserProvider::class
//            ],
            ],
        // Hack for our database role hierarchy
            'role_hierarchy' => ['ROLE_USER' => 'ROLE_USER'],
//            'password_hashers' => [
//                    'Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface' => 'auto',
//                    'LegacyHasher' => ['id' => 'Oc\Security\LegacyHasher']

//            ],

            'firewalls' => [
                // 'dev' not in use
                    'dev' => [
                            'pattern' => '^/(_(profiler|wdt)|css|images|js)/',
                            'security' => false
                    ],
                    'main' => [
                            'lazy' => true,
                            'provider' => 'app_user_provider',
//                'provider' => 'users',
                            'logout' => [
                                    'path' => 'app_security_logout',
                                // where to redirect after logout
                                    'target' => 'app_index_index'
                            ],
                            'custom_authenticator' => 'Oc\Security\LoginFormAuthenticator',
                    ]
            ],
            'access_control' => [
                    [
                            'path' => '^/backend',
                            'roles' => [
                                    'ROLE_TEAM',
                            ]
                    ]
            ],
    ]);
};
