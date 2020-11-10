<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Manager extends Authenticatable
{
    use HasFactory, Notifiable;

    const CREATED_AT = 'create_time';
    const UPDATED_AT = 'updated_time';

    /**
     * 与模型关联的表名
     *
     * @var string
     */
    protected $table = 'tb_manager';


    /**
     * 与表关联的主键
     *
     * @var string
     */
    protected $primaryKey = 'manager_id';


    /**
     * 主键是否主动递增
     *
     * @var bool
     */
    public $incrementing = true;


    /**
     * 是否主动维护时间戳
     *
     * @var bool
     */
    public $timestamps = false;


    /**
     * 可添加字段
     *
     * @var array
     */
    protected $fillable = ['name', 'email', 'password'];


    /**
     * 隐藏字段
     *
     * @var array
     */
    protected $hidden = ['password', 'member_token'];

}
