<?php

namespace Oc\Repository;

use DateTime;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\DBALException;
use Doctrine\DBAL\Exception\InvalidArgumentException;
Use Oc\Entity\GeoCacheStatusModifiedEntity;
use Oc\Repository\Exception\RecordAlreadyExistsException;
use Oc\Repository\Exception\RecordNotFoundException;
use Oc\Repository\Exception\RecordNotPersistedException;
use Oc\Repository\Exception\RecordsNotFoundException;

/**
 * Class CacheStatusModifiedRepository
 *
 * @package Oc\Repository
 */
class CacheStatusModifiedRepository
{
    const TABLE = 'cache_status_modified';

    /** @var Connection */
    private $connection;

    /** @var UserRepository */
    private $userRepository;

    /** @var CacheStatusRepository */
    private $cacheStatusRepository;

    /**
     * CacheStatusModifiedRepository constructor.
     *
     * @param Connection $connection
     * @param UserRepository $userRepository
     * @param CacheStatusRepository $cacheStatusRepository
     */
    public function __construct(
        Connection $connection,
        UserRepository $userRepository,
        CacheStatusRepository $cacheStatusRepository
    )
    {
        $this->connection = $connection;
        $this->userRepository = $userRepository;
        $this->cacheStatusRepository = $cacheStatusRepository;
    }

    /**
     * @return array
     * @throws RecordNotFoundException
     * @throws RecordsNotFoundException
     */
    public function fetchAll()
    {
        $statement = $this->connection->createQueryBuilder()
            ->select('*')
            ->from(self::TABLE)
            ->execute();

        $result = $statement->fetchAll();

        if ($statement->rowCount() === 0) {
            throw new RecordsNotFoundException('No records found');
        }

        $records = [];

        foreach ($result as $item) {
            $records[] = $this->getEntityFromDatabaseArray($item);
        }

        return $records;
    }

    /**
     * @param array $where
     *
     * @return GeoCacheStatusModifiedEntity
     * @throws RecordNotFoundException
     */
    public function fetchOneBy(array $where = [])
    {
        $queryBuilder = $this->connection->createQueryBuilder()
            ->select('*')
            ->from(self::TABLE)
            ->setMaxResults(1);

        if (count($where) > 0) {
            foreach ($where as $column => $value) {
                $queryBuilder->andWhere($column . ' = ' . $queryBuilder->createNamedParameter($value));
            }
        }

        $statement = $queryBuilder->execute();

        $result = $statement->fetch();

        if ($statement->rowCount() === 0) {
            throw new RecordNotFoundException('Record with given where clause not found');
        }

        return $this->getEntityFromDatabaseArray($result);
    }

    /**
     * @param array $where
     *
     * @return array
     * @throws RecordNotFoundException
     */
    public function fetchBy(array $where = [])
    {
        $queryBuilder = $this->connection->createQueryBuilder()
            ->select('*')
            ->from(self::TABLE);

        if (count($where) > 0) {
            foreach ($where as $column => $value) {
                $queryBuilder->andWhere($column . ' = ' . $queryBuilder->createNamedParameter($value));
            }
        }

        $statement = $queryBuilder->execute();

        $result = $statement->fetchAll();

        if ($statement->rowCount() === 0) {
//            throw new RecordsNotFoundException('No records with given where clause found');
        }

        $entities = [];

        foreach ($result as $item) {
            $entities[] = $this->getEntityFromDatabaseArray($item);
        }

        return $entities;
    }

    /**
     * @param GeoCacheStatusModifiedEntity $entity
     *
     * @return GeoCacheStatusModifiedEntity
     * @throws RecordAlreadyExistsException
     * @throws DBALException
     */
    public function create(GeoCacheStatusModifiedEntity $entity)
    {
        if (!$entity->isNew()) {
            throw new RecordAlreadyExistsException('The entity does already exist.');
        }

        $databaseArray = $this->getDatabaseArrayFromEntity($entity);

        $this->connection->insert(
            self::TABLE,
            $databaseArray
        );

        $entity->cacheId = (int) $this->connection->lastInsertId();

        return $entity;
    }

    /**
     * @param GeoCacheStatusModifiedEntity $entity
     *
     * @return GeoCacheStatusModifiedEntity
     * @throws RecordNotPersistedException
     * @throws DBALException
     */
    public function update(GeoCacheStatusModifiedEntity $entity)
    {
        if ($entity->isNew()) {
            throw new RecordNotPersistedException('The entity does not exist.');
        }

        $databaseArray = $this->getDatabaseArrayFromEntity($entity);

        $this->connection->update(
            self::TABLE,
            $databaseArray,
            ['cache_id' => $entity->cacheId]
        );

        return $entity;
    }

    /**
     * @param GeoCacheStatusModifiedEntity $entity
     *
     * @return GeoCacheStatusModifiedEntity
     * @throws DBALException
     * @throws RecordNotPersistedException
     * @throws InvalidArgumentException
     */
    public function remove(GeoCacheStatusModifiedEntity $entity)
    {
        if ($entity->isNew()) {
            throw new RecordNotPersistedException('The entity does not exist.');
        }

        $this->connection->delete(
            self::TABLE,
            ['cache_id' => $entity->cacheId]
        );

        $entity->cacheId = null;

        return $entity;
    }

    /**
     * @param GeoCacheStatusModifiedEntity $entity
     *
     * @return array
     */
    public function getDatabaseArrayFromEntity(GeoCacheStatusModifiedEntity $entity)
    {
        return [
            'cache_id' => $entity->cacheId,
            'date_modified' => $entity->dateModified,
            'old_state' => $entity->oldState,
            'new_state' => $entity->newState,
            'user_id' => $entity->userId,
        ];
    }

    /**
     * @param array $data
     *
     * @return GeoCacheStatusModifiedEntity
     * @throws RecordNotFoundException
     */
    public function getEntityFromDatabaseArray(array $data)
    {
        $entity = new GeoCacheStatusModifiedEntity();
        $entity->cacheId = (int) $data['cache_id'];
        $entity->dateModified = new DateTime($data['date_modified']);
        $entity->oldState = (int) $data['old_state'];
        $entity->newState = (int) $data['new_state'];
        $entity->userId = (int) $data['user_id'];
        $entity->user = $this->userRepository->fetchOneById($entity->userId);
        $entity->cacheStatusOld = $this->cacheStatusRepository->fetchOneBy(['id' => $entity->oldState]);
        $entity->cacheStatusNew = $this->cacheStatusRepository->fetchOneBy(['id' => $entity->newState]);

        return $entity;
    }
}
