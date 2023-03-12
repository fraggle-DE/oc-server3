<?php

declare(strict_types=1);

//use Oc\Security\LoginFormAuthenticator;
//use Oc\Security\UserProvider;
use Oc\Entity\UserEntity;
use Oc\Security\LegacyHasher;
use Symfony\Component\DependencyInjection\Loader\Configurator\ContainerConfigurator;
use Symfony\Config\SecurityConfig;

return static function (ContainerConfigurator $containerConfigurator, SecurityConfig $security): void {
//    $security->passwordHasher(UserEntity::class)
//            ->id(LegacyHasher::class)
//            ->algorithm(LegacyHasher::class);

//    $security->provider('app_user_provider')
//            ->entity()
//            ->class(User::class)
//            ->property('email');

    // TODO: die Rollenhierarchie hier einpflegen statt in der Datenbank? Was ist effizienter?
    // https://symfony.com/doc/current/security.html#security-role-hierarchy
    // $security->roleHierarchy('ROLE_SUPER_ADMIN', ['ROLE_ADMIN', 'ROLE_USER']);

    // https://symfony.com/doc/current/reference/configuration/security.html#access-control
    // https://symfony.com/doc/5.3/security/user_providers.html#user-session-refresh
    $containerConfigurator->extension('security', [
            'password_hashers' => [
                    'Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface' => 'auto'
            ],
            'providers' => [
//                    'app_user_provider' => [
//                            'entity' => [
//                                    'class' => UserEntity::class,
//                                    'property' => 'username',
//                            ]
//                    ],
//                    'users_in_memory' => [
//                            'memory' => null
//                    ],
                    'OC_user_provider' => [
                            'id' => 'Oc\Security\UserProvider',
                    ]
            ],
        // Hack for our database role hierarchy
            'role_hierarchy' => ['ROLE_USER' => 'ROLE_USER'],

            'firewalls' => [
                // 'dev' is not in use, even in dev environment
                    'dev' => [
                            'lazy' => true,
                            'pattern' => '^/(_(profiler|wdt)|css|images|js)/',
                            'security' => false,
                            'custom_authenticator' => 'Oc\Security\LoginFormAuthenticator',
                            'logout' => [
                                    'enable_csrf' => true,
                                    'path' => 'app_security_logout',
                                    'target' => 'app_index_index' // where to redirect after logout
                            ],
                            'provider' => 'OC_user_provider',
                    ],
                    'main' => [
                            'custom_authenticator' => 'Oc\Security\LoginFormAuthenticator',
//                            'form_login' => [
//                                    'check_path' => '',
//                                    'form_only' => true,
//                                    'password_parameter' => 'password',
//                                    'username_parameter' => 'username'
//                            ],
                            'lazy' => true,
                            'logout' => [
                                    'enable_csrf' => true,
                                    'path' => 'app_security_logout',
                                    'target' => 'app_index_index' // where to redirect after logout
                            ],
                            'provider' => 'OC_user_provider',
//                            'provider' => 'app_user_provider',
//                            'provider' => 'users_in_memory',
                            'stateless' => true,
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
//    dd($containerConfigurator);
//    die();

};
