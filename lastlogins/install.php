<?php

/**
 * This function is called on installation and is used to create database schema for the plugin
 */
function extension_install_lastlogins()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery("CREATE TABLE IF NOT EXISTS `lastlogins` (
                              `ID` INT(11) NOT NULL AUTO_INCREMENT,
                              `HARDWARE_ID` INT(11) NOT NULL,
                              `LL_USERNAME` VARCHAR(255) DEFAULT NULL,
                              `LL_TIMESTAMP` VARCHAR(255) DEFAULT NULL,
                              PRIMARY KEY  (`ID`,`HARDWARE_ID`)
                            ) ENGINE=INNODB ;");
}

/**
 * This function is called on removal and is used to destroy database schema for the plugin
 */
function extension_delete_lastlogins()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `lastlogins`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_lastlogins()
{

}

function extension_hook_lastlogins()
{}
