<?php
/***************************************************************************
 * for license information see LICENSE.md
 ***************************************************************************/

namespace Oc\Libse\Validator;

class ArrayValidator
{
    private $values;

    public function __construct($values)
    {
        $this->values = $values;
    }

    public function isValid($value)
    {
        return in_array($value, $this->values);
    }
}
